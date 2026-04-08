FROM python:3.14.4-slim-bookworm@sha256:336220baf4dc02a9da56db1720ce6d248aa7c62a0445af0ea1876ae76cc99bed

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
