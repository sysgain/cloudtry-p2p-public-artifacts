#!/bin/bash
git clone https://github.com/sysgain/km-docker-nodejs.git ~/km-docker-nodejs2
cd ~/km-docker-nodejs2
COMPOSE_HTTP_TIMEOUT=180 sudo docker-compose up -d
sudo docker-compose up -d
