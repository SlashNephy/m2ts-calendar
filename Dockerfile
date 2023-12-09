FROM python:3.12.1-slim-bookworm@sha256:123229cfb27c384ee1fcc15aec660ad280a09121b7893377e80ae1b2e72cf942

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
