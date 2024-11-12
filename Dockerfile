FROM python:3.13.0-slim-bookworm@sha256:95cc02c63242b61afc438ea3b99eb047bfccd091f9b33a0f528a4fa551689a70

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
