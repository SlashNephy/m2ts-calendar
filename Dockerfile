FROM python:3.13.1-slim-bookworm@sha256:a569688edb9acf677e8356c3db3eac4b56773e9859f83086d0d580c985cccc9b

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
