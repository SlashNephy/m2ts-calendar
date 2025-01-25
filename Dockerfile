FROM python:3.13.1-slim-bookworm@sha256:026dd417a88d0be8ed5542a05cff5979d17625151be8a1e25a994f85c87962a5

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
