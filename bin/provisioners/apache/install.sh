#!/usr/bin/env bash

#Install Apache
apt-get -y install apache2


sed -i "s|\APACHE_RUN_USER=www-data|APACHE_RUN_USER=vagrant|g" /etc/apache2/envvars
sed -i "s|\APACHE_RUN_GROUP=www-data|APACHE_RUN_GROUP=vagrant|g" /etc/apache2/envvars

chown -R vagrant:vagrant /var/lock/apache2

a2enmod rewrite
a2enmod headers
a2enmod php5