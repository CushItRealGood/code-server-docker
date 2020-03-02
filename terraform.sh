#!/bin/bash
sudo apt-get install -y jq 
CUR_VER=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
wget "https://releases.hashicorp.com/terraform/${CUR_VER}/terraform_${CUR_VER}_linux_amd64.zip"
unzip terraform_${CUR_VER}_linux_amd64.zip
sudo rm terraform_${CUR_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform