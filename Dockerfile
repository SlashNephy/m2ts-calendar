FROM python:3.12.5-slim-bookworm@sha256:66eca1a0be6b978565f2d6e7f89daf4e1f1891380a2278feecf003d1537c7630

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
