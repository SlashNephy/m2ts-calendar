FROM python:3.12.2-slim-bookworm@sha256:eb53cb99a609b86da6e239b16e1f2aed5e10cfbc538671fc4631093a00f133f2

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
