FROM python:3.12.5-slim-bookworm@sha256:105e9d85a67db1602e70fa2bbb49c1e66bae7e3bdcb6259344fe8ca116434f74

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
