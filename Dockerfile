FROM python:3.13.0-slim-bookworm@sha256:751d8bece269ba9e672b3f2226050e7e6fb3f3da3408b5dcb5d415a054fcb061

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
