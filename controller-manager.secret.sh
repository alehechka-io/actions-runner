APP_ID="246124"
INSTALLATION_ID="30081570"
PRIVATE_KEY_FILE_PATH="./private-key.pem"

kubectl create secret generic controller-manager \
    -n actions-runner-system \
    --from-literal=github_app_id=${APP_ID} \
    --from-literal=github_app_installation_id=${INSTALLATION_ID} \
    --from-file=github_app_private_key=${PRIVATE_KEY_FILE_PATH}