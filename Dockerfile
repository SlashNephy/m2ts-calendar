FROM python:3.13.2-slim-bookworm@sha256:f3614d98f38b0525d670f287b0474385952e28eb43016655dd003d0e28cf8652

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
