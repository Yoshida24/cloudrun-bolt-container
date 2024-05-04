set -a && source ./.env && set +a  

# gcloudコマンドを実行してリポジトリ一覧を取得し、grepで指定したリポジトリ名を検索
repo_exists=$(gcloud artifacts repositories list --project="${GCP_PROJECT}" | grep "${ARTIFACTS_REPO_NAME}")

if [[ -n "$repo_exists" ]]; then
    echo "Repository ${ARTIFACTS_REPO_NAME} already exists. Skipping repository creation."
else
    gcloud artifacts repositories create ${ARTIFACTS_REPO_NAME} \
        --repository-format=docker \
        --location=${GCP_ZONE} \
        --project=${GCP_PROJECT}
fi
