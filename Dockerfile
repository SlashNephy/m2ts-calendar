FROM python:3.12.4-slim-bookworm@sha256:d5f16749562233aa4bd26538771d76bf0dfd0a0ea7ea8771985e267451397ae4

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
