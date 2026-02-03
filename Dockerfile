FROM python:3.14.2-slim-bookworm@sha256:e87711ef5c86aaeaa7031718a69db79d334d94c545c709583f651b8185870941

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
