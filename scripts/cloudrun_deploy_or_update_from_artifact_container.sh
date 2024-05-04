set -a && source ./.env && set +a

gcloud beta run deploy ${CLOUDRUN_SERVICE_NAME} \
    --image ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG} --allow-unauthenticated \
    --update-env-vars SLACK_BOT_TOKEN=${SLACK_BOT_TOKEN},SLACK_APP_TOKEN=${SLACK_APP_TOKEN} \
    --no-cpu-throttling \
    --service-min-instances 1
