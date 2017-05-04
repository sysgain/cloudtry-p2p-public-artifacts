#!/bin/bash

# install the required packages for CLI
apt-get update && apt-get install -y libssl-dev libffi-dev python-dev build-essential && apt-get install -y nodejs-legacy && apt-get install -y npm

npm install -g azure-cli