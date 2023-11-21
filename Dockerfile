FROM python:3.12.0-slim-bookworm@sha256:2d4aea774065e001d817c030f1790e2289866589530fb18cb764331df9eaa646

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
