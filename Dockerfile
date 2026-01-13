FROM python:3.14.2-slim-bookworm@sha256:55b18d5d89ddb3ef534fe447f660a35832559c2361f8ea3985a5fcda95396f97

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
