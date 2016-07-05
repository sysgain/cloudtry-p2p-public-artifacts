#!/bin/bash
keyName=$1
componentAdminUsername=$2
componentAdminPassword=$3
componentBaseUrl=$4
orchestratorbaseurl=$5
component="chefcc"

URL="http://$orchestratorbaseurl:33001/keys/$component/$componentAdminUsername/component"
echo $URL
# this api setups the private key  on the component - In this case, uploads the PRIVATE key to chef compliance. Response if successful is 200ok
curl -H "Content-Type: application/json" -X POST -d '{"keyName":"'"$keyName"'", "ownerUserName":"'"$componentAdminUsername"'","ownerPassword":"'"$componentAdminPassword"'", "componentBaseUrl":"'"$componentBaseUrl"'"}' $URL
