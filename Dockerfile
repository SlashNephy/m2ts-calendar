FROM python:3.12.4-slim-bookworm@sha256:1ef6f4d9c85f879bbda6d437048fc23ec4927452e90354bb754f26728a05021b

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
