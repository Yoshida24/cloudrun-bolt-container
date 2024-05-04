import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
from dotenv import load_dotenv

load_dotenv()

# 環境変数からトークンを取得
SLACK_BOT_TOKEN = os.environ.get("SLACK_BOT_TOKEN")
SLACK_APP_TOKEN = os.environ.get("SLACK_APP_TOKEN")

# Boltアプリの初期化
app = App(token=SLACK_BOT_TOKEN)

# メッセージイベントをリッスン
@app.message()
def echo_message(message, say):
    # 受け取ったメッセージをそのまま返信
    say(text=message['text'])

# Socket Mode ハンドラの起動
if __name__ == "__main__":
    handler = SocketModeHandler(app, SLACK_APP_TOKEN)
    handler.start()
