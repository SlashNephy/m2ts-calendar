FROM python:3.12.2-slim-bookworm@sha256:86cd49938a9b50c3663aa93cf5db9c8f498d6fe47f463a2cb967248b9e7d69de

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
