#!/bin/bash
set -a && . ./.env && set +a
echo "Local Server: http:localhost:8080/"
docker run -it -p 8080:8080 --rm ${GCP_ZONE}-docker.pkg.dev/${GCP_PROJECT}/${ARTIFACTS_REPO_NAME}/${ARTIFACTS_IMAGE_NAME}:${ARTIFACTS_IMAGE_TAG}

