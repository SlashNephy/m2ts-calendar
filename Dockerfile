FROM python:3.13.0-slim-bookworm@sha256:f7fa672880bbbc16d119ee7bd05e91609092f46137be1d3a85e1fc66dd60bc74

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
