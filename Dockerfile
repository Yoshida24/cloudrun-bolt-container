FROM --platform=linux/amd64 python:3.11-slim

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY src src
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

CMD uvicorn src.main:app --host 0.0.0.0 --port 8080

EXPOSE 8080
