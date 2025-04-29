FROM python:3.13.3-slim-bookworm@sha256:549df749715caa7da8649af1fbf5c0096838a0d69c544dc53c3b3864bfeda4e3

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
