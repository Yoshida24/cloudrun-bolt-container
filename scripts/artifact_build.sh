set -a && source ./.env && set +a  

docker build -t ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG} .