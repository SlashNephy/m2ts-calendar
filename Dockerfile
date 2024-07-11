FROM python:3.12.4-slim-bookworm@sha256:f11725aba18c19664a408902103365eaf8013823ffc56270f921d1dc78a198cb

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
