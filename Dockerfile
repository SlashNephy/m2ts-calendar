FROM python:3.14.0-slim-bookworm@sha256:f241b2f9bf06e07f4018c9f84d4910c0bc3066a42945ddedc715afa6867e5551

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
