set -a && source ./.env && set +a

echo ${SLACK_APP_TOKEN} | gcloud secrets create SLACK_APP_TOKEN --data-file=-
echo ${SLACK_BOT_TOKEN} | gcloud secrets create SLACK_BOT_TOKEN --data-file=-
