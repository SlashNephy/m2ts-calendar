FROM python:3.12.6-slim-bookworm@sha256:8ac54da5710cdd31639bb66f5bc1888948fc2866c0b5b52913b4b33d8252e510

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
