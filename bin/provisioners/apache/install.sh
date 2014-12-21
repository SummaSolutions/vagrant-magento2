#!/usr/bin/env bash

#Install Apache
apt-get -y install apache2

a2enmod rewrite
a2enmod headers
a2enmod php5