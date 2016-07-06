#!/bin/bash

# this will perform the following tasks
# 1. Install the Orchestrator Application in docker
# 2. Generate a KeyPair
# 3. Bootstrap the Private Key to the Chef Compliance Server

keyName=$1
componentAdminUsername=$2
componentAdminPassword=$3
componentBaseUrl=$4
orchestratorbaseurl=$5
email=$6
component=$7

echo $componentAdminUsername

git clone https://github.com/sysgain/km-docker-nodejs.git ~/km-docker-nodejs2
cd ~/km-docker-nodejs2
COMPOSE_HTTP_TIMEOUT=180 sudo docker-compose up -d
sleep 120
COMPOSE_HTTP_TIMEOUT=240 sudo docker-compose up -d
sleep 120
echo $componentAdminUsername
URL="http://$orchestratorbaseurl:33001/keys/$component/$componentAdminUsername/keypairs"
echo $URL
sleep 30
# this api generates a key pair and stores it in the database for a particular component admin user. The email is used for creating public private key
curl -H "Content-Type: application/json" -X POST -d '{"keyName":"'"$keyName"'", "password":"'"$componentAdminPassword"'", "email":"'"$email"'"}' $URL

URL="http://$orchestratorbaseurl:33001/keys/$component/$componentAdminUsername/component"
echo $URL
# this api setups the private key  on the component - In this case, uploads the PRIVATE key to chef compliance. Response if successful is 200ok
curl -H "Content-Type: application/json" -X POST -d '{"keyName":"'"$keyName"'", "ownerUserName":"'"$componentAdminUsername"'","ownerPassword":"'"$componentAdminPassword"'", "componentBaseUrl":"'"$componentBaseUrl"'"}' $URL
