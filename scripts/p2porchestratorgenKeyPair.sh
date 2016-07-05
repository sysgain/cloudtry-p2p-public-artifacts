#!/bin/bash
keyName=$1
componentAdminUsername=$2
componentAdminPassword=$3
componentBaseUrl=$4
orchestratorbaseurl=$5
component=$6
email=$7


URL="http://$orchestratorbaseurl:33001/keys/$component/$componentAdminUsername/keypairs"
echo $URL
# this api generates a key pair and stores it in the database for a particular component admin user. The email is used for creating public private key
curl -H "Content-Type: application/json" -X POST -d '{"keyName":"'"$keyName"'", "password":"'"$componentAdminPassword"'", "email":"'"$email"'"}' $URL
