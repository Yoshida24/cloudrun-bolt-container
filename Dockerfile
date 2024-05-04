FROM --platform=linux/amd64 python:3.11-slim

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY src src
COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

ENV SLACK_BOT_TOKEN=SLACK_BOT_TOKEN
ENV SLACK_APP_TOKEN=SLACK_APP_TOKEN

CMD ["python", "src/main.py"]

EXPOSE 8080
