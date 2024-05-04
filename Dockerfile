FROM --platform=linux/amd64 python:3.11-slim

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY src src
COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# 環境変数の設定（本番では異なる方法で設定することが推奨されます）
ENV SLACK_BOT_TOKEN=your-slack-bot-token
ENV SLACK_APP_TOKEN=your-slack-app-token

CMD ["python", "src/main.py"]

EXPOSE 8080
