FROM python:3.14.4-slim-bookworm@sha256:9981f4e8c82ecafdfe1a755b60ef692c7d89274760452a5f3c7ac1a7eee436ca

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
