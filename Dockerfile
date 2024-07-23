FROM python:3.12.4-slim-bookworm@sha256:fbc51bd56b68084ad398cf601546e7cd0733d6e7c1c62c11cc2c42205efd9127

COPY ./app.py /app.py

WORKDIR /
ENTRYPOINT [ "python", "-u", "/app.py" ]
