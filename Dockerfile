FROM python:3.13.3-slim-bookworm@sha256:60248ff36cf701fcb6729c085a879d81e4603f7f507345742dc82d4b38d16784

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
