FROM python:3.12.1-slim-bookworm@sha256:ebd449f31941e50b2d459e93c6c13e9a5c62b33dfd2b346618ad185c2a4ae59a

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
