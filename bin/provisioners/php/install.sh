#!/usr/bin/env bash
echo "deb http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/dotdeb.list
echo "deb-src http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/dotdeb.list

wget http://www.dotdeb.org/dotdeb.gpg -O- |apt-key add -

apt-get update
apt-get -y install php5 php5-common php5-mysql php5-dev php5-mcrypt php5-gd php5-curl php5-cli ssl-cert php-pear


sed -i '/display_errors = Off/c display_errors = On' /etc/php5/apache2/php.ini
sed -i '/error_reporting = E_ALL & ~E_DEPRECATED/c error_reporting = E_ALL | E_STRICT' /etc/php5/apache2/php.ini
sed -i '/html_errors = Off/c html_errors = On' /etc/php5/apache2/php.ini