FROM python:3.12.1-slim-bookworm@sha256:a1f70a0d7106954f5c55cb4d70fcdf07c5ee792f71cfeba4f3004ae7f850fd86

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
