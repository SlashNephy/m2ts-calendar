import glob
import itertools
import os
import re
import time

CHECK_INTERVAL_SECONDS = int(os.getenv("CHECK_INTERVAL_SECONDS", "60"))
FILENAME_FORMATS = os.environ["FILENAME_FORMATS"]
SOURCE_FILE_GLOB = os.environ["SOURCE_FILE_GLOB"]
TARGET_DIRECTORY = os.environ["TARGET_DIRECTORY"]
CONVERT_SHORTYEAR_TO_FULLYEAR = bool(os.getenv("CONVERT_SHORTYEAR_TO_FULLYEAR"))
DEFAULT_CLASS_NAME = os.getenv("DEFAULT_CLASS_NAME")
CLEANUP_INVALID_LINKS = bool(os.getenv("CLEANUP_INVALID_LINKS"))


def check(patterns):
    paths = []
    for path in glob.glob(SOURCE_FILE_GLOB):
        filename = os.path.basename(path)

        for pattern in patterns:
            match = pattern.match(filename)
            if match:
                try:
                    groups = match.groupdict()
                    year = groups.get("YEAR") or f"{'20' if CONVERT_SHORTYEAR_TO_FULLYEAR else ''}{groups['SHORTYEAR']}"
                    month = groups.get("MONTH")

                    key = f"{year}-{month}"
                    break
                except IndexError:
                    continue
        else:
            key = DEFAULT_CLASS_NAME
            if not key:
                continue

        paths.append((path, key))

    paths.sort(key=lambda x: x[1])
    for key, values in itertools.groupby(paths, key=lambda x: x[1]):
        key_dir = os.path.join(TARGET_DIRECTORY, key)
        if not os.path.exists(key_dir):
            os.makedirs(key_dir)

        for path, _ in values:
            link_path = os.path.join(key_dir, os.path.basename(path))
            if os.path.exists(link_path):
                continue

            print(f"Creating link: {link_path}")
            os.symlink(path, link_path)

def clean_up():
    if CLEANUP_INVALID_LINKS:
        for path in glob.glob(f"{TARGET_DIRECTORY}/**/*", recursive=True):
            if os.path.islink(path) and not os.path.exists(os.readlink(path)):
                print(f"Removing invalid link: {path}")
                os.remove(path)

def main():
    filename_patterns = [
        re.compile(
            re.sub(r"%([A-Z_]+)%", lambda m: fr"(?P<{m.group(1)}>.+)", re.escape(fmt))
        )
        for fmt in FILENAME_FORMATS.split(",")
    ]

    while True:
        check(filename_patterns)
        clean_up()

        time.sleep(CHECK_INTERVAL_SECONDS)


if __name__ == "__main__":
    main()
