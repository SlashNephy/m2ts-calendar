FROM python:3.12.0-slim-bookworm@sha256:80571b64ab7b94950d49d413f074e1932b65f6f75e0c34747b40ea41889a2ca9

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
