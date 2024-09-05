FROM python:3.12.5-slim-bookworm@sha256:6fdb82b3104290018049ba21e2d41160dffec5b1f3e0d4c96f7ee74eaca1624b

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
