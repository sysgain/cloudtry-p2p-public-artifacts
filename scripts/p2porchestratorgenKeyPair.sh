#!/bin/bash
keyName=$1
password=$2
email=$3
componentadminusername=$4
component=$5
orchestratorbaseurl=$6

URL="http://$orchestratorbaseurl:33001/keys/$component/$componentadminusername/keypairs"
echo $URL
# this api generates a key pair and stores it in the database for a particular component admin user. The email is used for creating public private key
curl -H "Content-Type: application/json" -X POST -d '{"keyName":"'"$keyName"'", "password":"'"$password"'", "email":"'"$email"'"}' $URL
