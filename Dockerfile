FROM python:3.12.4-slim-bookworm@sha256:d3a32591680bdfd49da5773495730cf8afdb817e217435db66588b2c64db6d5e

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
