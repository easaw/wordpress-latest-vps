#!/bin/bash

echo Please run as sudo;

apt update

apt upgrade

apt install apache2

systemctl start apache2

systemctl enable apache2

apt install software-properties-common python-software-properties

LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

apt update

apt install php7.3 php7.3-cli php7.3-common

#add most ommon PHP modules

apt install php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl

a2enmod php7.3

ufw allow in "Apache Full"

systemctl restart apache2

#use sudo apt install mysql-server for MySQL
sudo apt install mariadb-server

mysql_secure_installation

mysql -u root -p 

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

exit;

sudo apt update

systemctl restart apache2

a2enmod rewrite

cd /tmp

wget https://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz

touch /tmp/wordpress/.htaccess

cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php

mkdir /tmp/wordpress/wp-content/upgrade

cp -a /tmp/wordpress/. /var/www/html/

chown -R www-data:www-data /var/www/html/

find /var/www/html/ -type d -exec chmod 750 {} \;

find /var/www/html/ -type f -exec chmod 640 {} \;

#add salts coming later
#curl -s https://api.wordpress.org/secret-key/1.1/salt/

echo PLEASE CHANGE SALTS in wp-config!





