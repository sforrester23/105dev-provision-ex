#!/bin/bash

# nginx
sudo apt-get update -y
sudo apt-get install nginx -y

# want to be able to install hostsupdater too?
# vagrant plugin install vagrant-hostsupdater
# but this is executed outside of the ssh command line, so does it work the same?

# node.js
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
