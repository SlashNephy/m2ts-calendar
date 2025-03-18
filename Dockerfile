FROM python:3.13.2-slim-bookworm@sha256:8f3aba466a471c0ab903dbd7cb979abd4bda370b04789d25440cc90372b50e04

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
