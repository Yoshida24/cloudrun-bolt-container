set -a && source ./.env && set +a

service_exists=$(gcloud run services list --project="${GCP_PROJECT}" | grep "${CLOUDRUN_SERVICE_NAME}")

if [[ -n "$service_exists" ]]; then
    gcloud run services delete ${CLOUDRUN_SERVICE_NAME} \
        --project=${GCP_PROJECT}
else
    echo "CloudRun ${CLOUDRUN_SERVICE_NAME} already deleted. Skipping deletion."
fi