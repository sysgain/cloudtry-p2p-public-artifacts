#!/bin/bash

# this will perform the following tasks
# 1. Install the Orchestrator Application in docker

git clone https://github.com/umar2code/km-docker-nodejs.git ~/km-docker-nodejs
cd ~/km-docker-nodejs
COMPOSE_HTTP_TIMEOUT=180 sudo docker-compose up -d
sudo docker-compose up -d
