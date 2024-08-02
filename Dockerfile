FROM python:3.12.4-slim-bookworm@sha256:bf20beb349a2762d6adccf370eaa4ff40bc367a4c7fe563110e08f0dbd7eaa2e

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
