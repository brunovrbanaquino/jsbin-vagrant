#!/usr/bin/env bash
 
sudo apt-get update

# Install git
sudo apt-get install -y git

# Intall node
sudo apt-get install -y nodejs

# Install jsbin
cd /var/www
git clone git@github.com:remy/jsbin.git
cd jsbin
npm install

# Install nodemon
npm install -g nodemon

# Install mysql
sudo apt-get install -y mysql-server

# Create db
mysql -u root -e "create database jsbin"
# Create user and grant privileges to db
mysql -u root -e "GRANT ALL PRIVILEGES ON jsbin.* TO jsbin@hostname IDENTIFIED BY 'jsbin'"
# Load sql file
mysql -u root -p jsbin < /var/www/jsbin/build/full-db-v3.mysql.sql

# memcache

# nginx

# start jsbin
nodemon