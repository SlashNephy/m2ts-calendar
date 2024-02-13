FROM python:3.12.2-slim-bookworm@sha256:a9279003f473ff7cbbd07641e105846f604172b78c29487501470472ab459887

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
