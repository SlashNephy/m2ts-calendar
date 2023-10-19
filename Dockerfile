FROM python:3.12.0-slim-bookworm@sha256:babc0d450bf9ed2b369814bc2f466e53a6ea43f1201f6df4e7988751f755c52c

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
