set -a && source ./.env && set +a  

# gcloudコマンドを実行してリポジトリ一覧を取得し、grepで指定したリポジトリ名を検索
repo_exists=$(gcloud artifacts repositories list --project="${GCP_PROJECT}" | grep "${ARTIFACTS_REPO_NAME}")

if [[ -n "$repo_exists" ]]; then
    gcloud artifacts repositories delete ${ARTIFACTS_REPO_NAME} \
        --location=${GCP_ZONE}
else
    echo "Artifacts ${ARTIFACTS_REPO_NAME} already deleted. Skipping deletion."
fi