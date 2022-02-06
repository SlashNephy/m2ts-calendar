import itertools
import os
import re
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Generator, Optional

FILENAME_FORMATS = [v for k, v in os.environ.items() if k.startswith("FILENAME_FORMATS")]
SOURCE_DIRECTORY = os.environ["SOURCE_DIRECTORY"]
SOURCE_FILE_GLOB = os.environ["SOURCE_FILE_GLOB"]
INCLUDE_CHAPTER_FILE = os.getenv("INCLUDE_CHAPTER_FILE") == "1"
TARGET_DIRECTORY = os.environ["TARGET_DIRECTORY"]
CLASS_NAME_FORMAT = os.getenv("CLASS_NAME_FORMAT", r"%YEAR%-%MONTH%")
DEFAULT_CLASS_NAME = os.getenv("DEFAULT_CLASS_NAME")
CHECK_INTERVAL_SECONDS = int(os.getenv("CHECK_INTERVAL_SECONDS", "60"))
CLEANUP_BROKEN_LINKS = os.getenv("CLEANUP_BROKEN_LINKS") == "1"
CLEANUP_EMPTY_DIRECTORIES = os.getenv("CLEANUP_EMPTY_DIRECTORIES") == "1"
DRYRUN = os.getenv("DRYRUN") == "1"


# Represents a single file in the source directory.
@dataclass
class SourcePath:
    class_name: str
    path: Path
    is_chapter_file: bool

# Iterate over all files in the source directory.
def enumerate_source_files() -> Generator[Path, None, None]:
    return Path(SOURCE_DIRECTORY).glob(SOURCE_FILE_GLOB)

# Extract common class name from filename.
def extract_class_name(filename, source_patterns, class_pattern) -> Optional[str]:
    for pattern in source_patterns:
        match = pattern.match(filename)
        if match:
            try:
                groups = match.groupdict()
                if "YEAR" not in groups and "SHORTYEAR" in groups:
                    groups["YEAR"] = f"20{groups['SHORTYEAR']}"

                return class_pattern.format(**groups)
            except IndexError:
                continue

    return DEFAULT_CLASS_NAME

def sort_source_paths(source_patterns, class_pattern) -> list[SourcePath]:
    paths = []
    for path in enumerate_source_files():
        class_name = extract_class_name(path.name, source_patterns, class_pattern)
        if not class_name:
            continue

        paths.append(
            SourcePath(class_name, path, False)
        )

        if INCLUDE_CHAPTER_FILE:
            parent_dir = path.parent
            chapter_filename = path.with_suffix(".chapter").name

            chapter_paths = (
                parent_dir / chapter_filename,
                parent_dir / "chapters" / chapter_filename,
            )
            for chapter_path in chapter_paths:
                if chapter_path.exists():
                    paths.append(
                        SourcePath(class_name, chapter_path, True)
                    )
                    break

    return sorted(paths, key=lambda x: x.class_name)

def check(source_patterns, class_pattern):
    paths = sort_source_paths(source_patterns, class_pattern)

    for key, sources in itertools.groupby(paths, key=lambda x: x.class_name):
        key_dir = Path(TARGET_DIRECTORY) / key

        for source in sources:
            if source.is_chapter_file:
                link_path = key_dir / "chapters" / source.path.name
            else:
                link_path = key_dir / source.path.name

            if link_path.exists() and not link_path.is_symlink():
                continue
            if link_path.exists() and link_path.readlink() == source.path:
                continue

            if not link_path.parent.exists() and not DRYRUN:
                link_path.parent.mkdir(parents=True)

            print(f"Creating link: {link_path}")
            if not DRYRUN:
                link_path.symlink_to(source.path)

def clean_up():
    if CLEANUP_BROKEN_LINKS:
        for path in Path(TARGET_DIRECTORY).glob("**/*"):
            if path.is_symlink() and not path.readlink().exists():
                print(f"Removing invalid link: {path}")
                if not DRYRUN:
                    path.unlink()

    if CLEANUP_EMPTY_DIRECTORIES:
        for path in Path(TARGET_DIRECTORY).glob("*"):
            if path.is_dir() and not path.iterdir():
                print(f"Removing empty directory: {path}")
                if not DRYRUN:
                    path.rmdir()

def main():
    # Compile regex patterns in order to parse filenames
    source_patterns = [
        re.compile(
            re.sub(r"%([A-Z_]+)%", lambda m: fr"(?P<{m.group(1)}>.+)", re.escape(fmt))
        )
        for fmt in FILENAME_FORMATS
    ]
    if not source_patterns:
        raise ValueError("No filename patterns defined")

    class_pattern = re.sub(r"%([A-Z_]+)%", lambda m: f"{{{m.group(1)}}}", CLASS_NAME_FORMAT)

    while True:
        check(source_patterns, class_pattern)
        clean_up()

        time.sleep(CHECK_INTERVAL_SECONDS)


if __name__ == "__main__":
    main()
