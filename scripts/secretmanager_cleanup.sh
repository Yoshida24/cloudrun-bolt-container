set -a && source ./.env && set +a

gcloud secrets delete SLACK_APP_TOKEN --quiet
gcloud secrets delete SLACK_BOT_TOKEN --quiet
