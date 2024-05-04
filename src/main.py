import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
from dotenv import load_dotenv
from flask import Flask, jsonify
from threading import Thread

load_dotenv()

# 環境変数からトークンを取得
SLACK_BOT_TOKEN = os.environ.get("SLACK_BOT_TOKEN")
SLACK_APP_TOKEN = os.environ.get("SLACK_APP_TOKEN")

# Flaskアプリの初期化
flask_app = Flask(__name__)

# HTTPサーバーのヘルスチェック用エンドポイント
@flask_app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "ok"})

@flask_app.route('/', methods=['GET'])
def root():
    return jsonify({"status": "ok"})

# Socket ModeとFlaskの並行実行
def run_flask():
    flask_app.run(host='0.0.0.0', port=8080)

# Boltアプリの初期化
app = App(token=SLACK_BOT_TOKEN)

# メッセージイベントをリッスン
@app.message()
def echo_message(message, say):
    # 受け取ったメッセージをそのまま返信
    say(text=message['text'])

# Socket Mode ハンドラの起動
if __name__ == "__main__":
    flask_thread = Thread(target=run_flask)
    flask_thread.start()
    handler = SocketModeHandler(app, SLACK_APP_TOKEN)
    handler.start()
