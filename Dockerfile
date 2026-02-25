FROM python:3.14.3-slim-bookworm@sha256:5404df00cf00e6e7273375f415651837b4d192ac6859c44d3b740888ac798c99

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
