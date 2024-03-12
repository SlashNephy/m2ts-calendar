FROM python:3.12.2-slim-bookworm@sha256:36d57d7f9948fefe7b6092cfe8567da368033e71ba281b11bb9eeffce3d45bc6

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
