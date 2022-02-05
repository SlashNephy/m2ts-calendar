# m2ts-calendar
🧹 Create symlinks for .m2ts files and classify them into directories in yyyy-mm format.

## docker-compose

```yml
version: '3.8'

services:
  calendar:
    container_name: m2ts-calendar
    image: ghcr.io/slashnephy/m2ts-calendar
    restart: always
    network_mode: none
    volumes:
      - /mnt/records:/mnt/records:ro
      - /mnt/records_links:/mnt/records_links
    environment:
      FILENAME_FORMATS: '[%SHORTYEAR%-%MONTH%-%DAY%(%DOW%)_%HOUR%-%MIN%][%TYPE%_%HALF_WIDTH_CHNAME%]%HALF_WIDTH_TITLE%'
      SOURCE_FILE_GLOB: '/mnt/records/*.m2ts'
      TARGET_DIRECTORY: '/mnt/records_links'
      DEFAULT_CLASS_NAME: 'misc'
      CONVERT_SHORTYEAR_TO_FULLYEAR: 1
      CLEANUP_INVALID_LINKS: 1
      CHECK_INTERVAL_SECONDS: 60
```
