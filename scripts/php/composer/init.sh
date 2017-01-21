#!/bin/bash

PHP_BIN=`which php`

cd /vagrant
$PHP_BIN -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$PHP_BIN -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$PHP_BIN composer-setup.php
$PHP_BIN -r "unlink('composer-setup.php');"

sudo mv /vagrant/composer.phar /usr/local/bin/composer
