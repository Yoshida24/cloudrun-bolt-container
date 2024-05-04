#!/bin/bash
set -a && . ./.env && set +a
echo "Bolt starting..."

docker run -it -p 8080:8080 --env-file .env \
    --rm ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG}
