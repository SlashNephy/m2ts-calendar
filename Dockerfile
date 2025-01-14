FROM python:3.13.1-slim-bookworm@sha256:23a81be7b258c8f516f7a60e80943cace4350deb8204cf107c7993e343610d47

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
