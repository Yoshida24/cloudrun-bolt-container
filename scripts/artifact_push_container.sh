set -a && source ./.env && set +a  

gcloud auth configure-docker ${GCP_ZONE}-docker.pkg.dev
docker push ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG}
