FROM python:3.12.5-slim-bookworm@sha256:835b9761efdd649d0c39c8ee688a6d70ffc22b770fcc8fb52ca322f74729d070

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
