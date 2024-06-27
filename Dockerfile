FROM python:3.12.4-slim-bookworm@sha256:da2d7af143dab7cd5b0d5a5c9545fe14e67fc24c394fcf1cf15e8ea16cbd8637

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
