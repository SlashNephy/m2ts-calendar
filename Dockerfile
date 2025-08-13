FROM python:3.13.6-slim-bookworm@sha256:b7ac0b5eec195c545c50d261131cc0dfa6058c58ddd656a3d5ff0412b6f408c6

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
