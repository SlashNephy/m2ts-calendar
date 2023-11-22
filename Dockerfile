FROM python:3.12.0-slim-bookworm@sha256:32477c7ecb3b18a47cff8eb5b8149bc21c858998b0ae2bb36f4ddb43cc79d240

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
