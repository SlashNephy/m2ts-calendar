FROM python:3.13.6-slim-bookworm@sha256:2b09112b54420d2e3e814f2cbe34e8e54d32b8c5abd4e72e89cda4758fc6400a

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
