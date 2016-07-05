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


# Step 1
sh p2pinstallOrchestratorApp.sh

# Step 2
sh p2porchestratorgenKeyPair.sh keyName componentAdminUsername componentAdminPassword componentBaseUrl orchestratorbaseurl component email

# Step3 
sh p2porchestratorBootstrapChefCompliance.sh keyName componentAdminUsername componentAdminPassword componentBaseUrl orchestratorbaseurl "chefcc" email

