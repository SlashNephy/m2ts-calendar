FROM python:3.12.5-slim-bookworm@sha256:cec3038ab6478f8c170b2f27174d74a2a6ff4d4fccb4bebacbbb5793e379c20f

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
