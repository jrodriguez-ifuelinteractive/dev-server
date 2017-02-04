#!/bin/bash

# Update script permissions
sudo chmod +x /vagrant/scripts/php/composer/init.sh
sudo chmod +x /vagrant/scripts/php/phpmyadmin/init.sh
sudo chmod +x /vagrant/scripts/node/init.sh
sudo chmod +x /vagrant/scripts/redis/init.sh
sudo chmod +x /vagrant/scripts/angular/init.sh

# Tools
sudo apt-get -qq update
sudo apt-get install -y python-software-properties
sudo apt-get install -y build-essential
sudo apt-get install -y zip
sudo apt-get install -y apache2
sudo apt-get install -y curl
sudo apt-get install -y git

# MySQL
sudo apt-get -qq update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server-5.6
sudo service mysql restart

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get -qq update
# php5.6; php7.0; php7.1
sudo apt-get install -y php5.6 php5.6-cli
sudo apt-get install -y php5.6-mysql
sudo apt-get install -y php5.6-simplexml
sudo apt-get install -y php5.6-mcrypt
sudo apt-get install -y php5.6-gd
sudo apt-get install -y php5.6-curl
sudo apt-get install -y php5.6-soap
sudo apt-get install -y php5.6-mbstring

# Composer
/vagrant/scripts/php/composer/init.sh

# PHPMyAdmin
/vagrant/scripts/php/phpmyadmin/init.sh

# Node
/vagrant/scripts/node/init.sh

# Angular
/vagrant/scripts/angular/init.sh

# Redis
/vagrant/scripts/redis/init.sh

# Apache Config
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo ln -sf /vagrant/scripts/apache/virtual_host.conf /etc/apache2/sites-enabled/virtual_host.conf
sudo rm /etc/apache2/envvars
sudo ln -sf /vagrant/scripts/apache/envvars /etc/apache2/envvars
sudo a2enmod rewrite
sudo service apache2 restart

# MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get -qq update
sudo apt-get install -y mongodb-org
sudo service mongod restart
