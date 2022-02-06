# m2ts-calendar
🧹 Create symlinks for .m2ts files and classify them into directories in yyyy-mm format.

![image](https://user-images.githubusercontent.com/7302150/152669250-38859e0a-c768-4b38-a768-9e53c4a09a10.png)
![image](https://user-images.githubusercontent.com/7302150/152669262-5f9738e2-6afd-47e5-9173-4e8b229e7397.png)

## docker-compose

```yml
version: '3.8'

services:
  calendar:
    container_name: m2ts-calendar
    image: ghcr.io/slashnephy/m2ts-calendar
    restart: always
    network_mode: none
    user: 1000:1000
    volumes:
      - /mnt/records:/mnt/records:ro
      - /mnt/records_links:/mnt/records_links
    environment:
      FILENAME_FORMATS1: '[%SHORTYEAR%-%MONTH%-%DAY%(%DOW%)_%HOUR%-%MIN%][%TYPE%_%HALF_WIDTH_CHNAME%]%HALF_WIDTH_TITLE%'
      FILENAME_FORMATS2: '[%SHORTYEAR%-%MONTH%-%DAY%_%HOUR%-%MIN%][%CHNAME%]%TITLE%'
      SOURCE_DIRECTORY: /mnt/records
      SOURCE_FILE_GLOB: '**/*.m2ts'
      INCLUDE_CHAPTER_FILE: 1
      TARGET_DIRECTORY: '/mnt/records_links'
      CLASS_NAME_FORMAT: '%YEAR%-%MONTH%'
      DEFAULT_CLASS_NAME: 'misc'
      CHECK_INTERVAL_SECONDS: 60
      CLEANUP_BROKEN_LINKS: 1
      DRYRUN: 0
```
