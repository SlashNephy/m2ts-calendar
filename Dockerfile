FROM python:3.13.0-slim-bookworm@sha256:0de818129b26ed8f46fd772f540c80e277b67a28229531a1ba0fdacfaed19bcb

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
