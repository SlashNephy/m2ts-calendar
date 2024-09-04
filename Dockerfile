FROM python:3.12.5-slim-bookworm@sha256:db6105a4838adc0bb41d0fe5b46bccbe357ad67a0cfe72156dff2d0aae635fc2

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
