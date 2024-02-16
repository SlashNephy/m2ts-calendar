FROM python:3.12.2-slim-bookworm@sha256:5c73034c2bc151596ee0f1335610735162ee2b148816710706afec4757ad5b1e

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
