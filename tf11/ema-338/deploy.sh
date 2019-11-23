#!bin/bash

pushd global_config
terraform init
terraform apply
TF_OUTPUT_GLOBAL_CONFIG=$(terraform output -json)
popd

pushd env_config
terraform init
terraform apply
TF_OUTPUT_ENV_CONFIG=$(terraform output -json)
popd

TF_OUTPUT_GLOBAL_CONFIG_MAP=$(echo $TF_OUTPUT_GLOBAL_CONFIG | jq '.global_config.value' | sed -e 's/: / = /g' -e 's/\",/\"/g')
TF_OUTPUT_ENV_CONFIG_MAP=$(echo $TF_OUTPUT_ENV_CONFIG | jq '.env_config.value' | sed -e 's/: / = /g' -e 's/\",/\"/g')
TF_OUTPUT_GLOBAL_CONFIG_POLICY=$(echo $TF_OUTPUT_GLOBAL_CONFIG | jq '.policy.value')

terraform init
terraform apply \
  -var "global_config=${TF_OUTPUT_GLOBAL_CONFIG_MAP}" \
  -var "env_config=${TF_OUTPUT_ENV_CONFIG_MAP}" \
  -var "policy=${TF_OUTPUT_GLOBAL_CONFIG_POLICY}"
