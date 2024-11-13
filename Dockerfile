FROM python:3.13.0-slim-bookworm@sha256:422e2d1d462346dd5aa91878d96856d8e4e40ee6acd5f581a4780d4bc8de0a66

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
