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

# install specific pm2 package globally
sudo npm install -g pm2@^3

# install the forever package
sudo npm install forever -g

# update default 
sudo cp app/src/default /etc/nginx/sites-available/default

# check if there are errors with nginx default file
sudo nginx -t

# restart nginx
sudo systemctl restart nginx

# add system variable to .bashrc file
sudo echo 'export DB_HOST=mongodb://192.168.10.150:27017/posts'>> .bashrc

# change directory to specified path
# cd /home/vagrant/app/app && npm install && forever start app.js
