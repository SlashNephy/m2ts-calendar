FROM python:3.13.0-slim-bookworm@sha256:9f1fccbba4ee5769dff765007f6f31686c71329cff735b5657093afd8e687492

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
