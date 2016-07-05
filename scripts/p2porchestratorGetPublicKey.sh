#!/bin/bash
keyName=$1
componentAdminUsername=$2
orchestratorbaseurl=$3
component=$4

URL="http://$orchestratorbaseurl:33001/keys/$component/$componentAdminUsername/keypairs/$keyName"
echo $URL


#this API retrieves the publickey given a keyname, username and component
curl -H "Content-Type: application/json" -X GET $URL
