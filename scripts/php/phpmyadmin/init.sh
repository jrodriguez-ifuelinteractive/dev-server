#!/bin/bash

cd /home/vagrant
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.zip
unzip phpMyAdmin-4.6.6-all-languages.zip
rm phpMyAdmin-4.6.6-all-languages.zip

sudo ln -sf /vagrant/scripts/php/phpmyadmin/phpmyadmin.conf /etc/apache2/conf-enabled
sudo ln -sf /vagrant/scripts/php/phpmyadmin/config.inc.php /home/vagrant/phpMyAdmin-4.6.6-all-languages/config.inc.php

sudo service apache2 restart
