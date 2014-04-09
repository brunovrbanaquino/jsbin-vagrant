#!/usr/bin/env bash
 
sudo apt-get update

# Intall node
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y python g++ make nodejs

# Install git
sudo apt-get install -y git

# Install jsbin
cd /var/www/jsbin
git clone https://github.com/jsbin/jsbin.git
cd jsbin
npm install

# Config file
cp /var/www/jsbin/config.local.json /var/www/jsbin/jsbin/

# Install nodemon
sudo npm install -g nodemon

# Install grunt
sudo npm install -g grunt-cli

# Install mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root_password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root_password'
sudo apt-get install -y mysql-server

# Create db
mysql -uroot -proot_password -e "create database jsbin"
# Create user and grant privileges to db
mysql -uroot -proot_password -e "GRANT ALL PRIVILEGES ON jsbin.* TO jsbin@localhost IDENTIFIED BY 'jsbin'"
# Load sql file
mysql -ujsbin -pjsbin jsbin < /var/www/jsbin/jsbin/build/full-db-v3.mysql.sql

# memcache
sudo apt-get install -y memcached

# nginx
# todo

# add jsbin to hosts file
sudo sed -i '$ a\127.0.0.1    jsbin.nix' /etc/hosts

# start jsbin
# nodemon