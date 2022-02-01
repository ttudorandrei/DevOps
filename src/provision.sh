#!/bin/bash

# run updates
sudo apt-get update -y

# run upgrades
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# download specific nodejs version with curl
curl -sl https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install previously downloaded nodejs
sudo apt-get install nodejs -y

# install pm2 package globally
sudo npm install pm2 -g

# change directory to specified path
# cd /app/app
