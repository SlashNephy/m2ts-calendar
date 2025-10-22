FROM python:3.14.0-slim-bookworm@sha256:8a8d3341dfc71b7420256ceff425f64247da7e23fbe3fc23c3ea8cfbad59096d

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
