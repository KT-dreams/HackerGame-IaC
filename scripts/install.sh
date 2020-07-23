#!/bin/bash

if [[ -z "${TERRAFORM_VERSION}" ]]; then
  export TERRAFORM_VERSION=0.12.20
fi

mkdir -p ~/bin

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

echo "Download Terraform ({$TERRAFORM_VERSION})"
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

echo "Download SHA256 cheksums and singature file"
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig

echo "Verify package"
sha256sum -c terraform_${TERRAFORM_VERSION}_SHA256SUMS 2>&1 | grep OK
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
mv terraform ~/bin/

if [[ -z "${TERRAGRUNT_VERSION}" ]]; then
  export TERRAGRUNT_VERSION=0.21.11
fi
  
echo "Download Terragunt (${TERRAGRUNT_VERSION})"
Download SHA256 cheksums
wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/SHA256SUMS -O terragrunt_v${TERRAGRUNT_VERSION}_SHA256SUMS
wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64

echo "Verify package"
sha256sum -c terragrunt_v${TERRAGRUNT_VERSION}_SHA256SUMS 2>&1 | grep OK
mv terragrunt_linux_amd64 ~/bin/terragrunt

chmod u+x ~/bin/*

echo "Install awscli"
pip3 install --user awscli

echo "Install pipenv"
pip3 install --user pipenv

echo "Setting TF plugin cache dir"
export TF_PLUGIN_CACHE_DIR="/vol0/terraform.d"
export TERRAGRUNT_DOWNLOAD="/vol0/terragrunt-cache"

echo "Cleaning"
rm -rf terraform_*
rm -rf terragrunt_*
