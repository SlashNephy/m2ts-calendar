FROM python:3.13.7-slim-bookworm@sha256:5fa2567616c8d0e9a9470c8b4c1cb8b6f4d9f2fd45a548df393bed3537a7a324

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
