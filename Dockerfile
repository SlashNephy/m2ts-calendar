FROM python:3.13.4-slim-bookworm@sha256:d97b595c5f4ac718102e5a5a91adaf04b22e852961a698411637c718d45867c8

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
