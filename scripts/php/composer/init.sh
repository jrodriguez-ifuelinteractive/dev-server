#!/bin/bash

PHP_BIN=`which php`

cd /vagrant
$PHP_BIN -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$PHP_BIN composer-setup.php
$PHP_BIN -r "unlink('composer-setup.php');"

sudo mv /vagrant/composer.phar /usr/local/bin/composer
