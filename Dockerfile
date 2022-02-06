FROM python:alpine

COPY ./app.py /app.py

LABEL org.opencontainers.image.source https://github.com/SlashNephy/m2ts-calendar
WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
