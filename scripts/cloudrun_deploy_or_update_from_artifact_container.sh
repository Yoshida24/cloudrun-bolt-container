set -a && source ./.env && set +a

gcloud run deploy ${CLOUDRUN_SERVICE_NAME} --image ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG} --allow-unauthenticated
