FROM python:3.12.1-slim-bookworm@sha256:c805c5edcf6005fd72f933156f504525e1da263ffbc3fae6b4940e6c360c216f

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
