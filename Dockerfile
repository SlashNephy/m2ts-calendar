FROM python:3.13.6-slim-bookworm@sha256:dbae11294fd02c6d65be6fc889633a3cf804e9586dbbf848bf4d3a294faa6482

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
