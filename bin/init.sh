#!/usr/bin/env bash
DB_NAME="magento"
URL="magento2.localhost"

#MYSQL DATABASE
echo "[$0] Creating Database..."
mysql -uroot <<QUERY_INPUT
DROP DATABASE IF EXISTS ${DB_NAME}; CREATE DATABASE ${DB_NAME};
QUERY_INPUT


cd /vagrant
if [ ! -d htdocs ];
then
  echo "[$0] Cloning Magento 2 Code base..."
  git clone https://github.com/magento/magento2.git htdocs
fi

cd htdocs
composer install
cd setup
composer install

cd setup
php index.php install --base_url=http://${URL}/ \
    --backend_frontname=admin \
    --db_host=localhost --db_name=magento --db_user=root \
    --admin_firstname=General --admin_lastname=admin --admin_email=fcapua@summasolutions.net \
    --admin_username=admin --admin_password=Magento2 --language=en_US \
    --currency=USD --timezone=America/Chicago \
    --session_save=db

#VIRTUAL HOST
echo "[$0] Creating Virtual Host"
sudo ln -s /vagrant/htdocs /var/www/magento

sudo cp /vagrant/conf/apache/site.conf /etc/apache2/sites-available/${URL}
sudo sed -i "s|\$URL|${URL}|g" /etc/apache2/sites-available/${URL}
sudo a2ensite ${URL}
sudo service apache2 restart
