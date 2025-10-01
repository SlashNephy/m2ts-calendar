FROM python:3.13.7-slim-bookworm@sha256:40bc30cde4a174928bb08d48cd02c3029ed1ae7d97449f938210acf228e558aa

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
