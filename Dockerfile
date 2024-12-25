FROM python:3.13.1-slim-bookworm@sha256:ad05c52e178ac777dd1d6d7df5ddf5f16364cfb1cd5f9f016193eafd92ab4854

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
