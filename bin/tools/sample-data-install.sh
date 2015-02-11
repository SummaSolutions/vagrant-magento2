#!/usr/bin/env bash
cd /var/www/magento
composer config repositories.magento composer http://packages.magento.com
composer require magento/sample-data:0.42.0.beta6 magento/sample-data-media:~0.42.0-beta1 --dev
php dev/tools/Magento/Tools/SampleData/install.php --admin_username=admin
