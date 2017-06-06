#!/bin/bash

PHP_BIN=`which php`

COMPOSER_SIG=`curl https://composer.github.io/installer.sig`

cd /vagrant
$PHP_BIN -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$PHP_BIN -r "if (hash_file('SHA384', 'composer-setup.php') === '$COMPOSER_SIG') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$PHP_BIN composer-setup.php
$PHP_BIN -r "unlink('composer-setup.php');"

sudo mv /vagrant/composer.phar /usr/local/bin/composer
