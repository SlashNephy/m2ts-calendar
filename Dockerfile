FROM python:3.13.5-slim-bookworm@sha256:1020ca463dc51c26bbad49de85dbb2986d93b71050102f3fa2a7f0fc4c2ea81e

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
