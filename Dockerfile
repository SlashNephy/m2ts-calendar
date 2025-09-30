FROM python:3.13.7-slim-bookworm@sha256:d2cdf9295b3705ba3c117f218f5c7fc0f2152aa9edc14528e65f33ca2fbaff3b

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
