#!/usr/bin/env bash

pecl install xdebug

XDEBUG_LOCATION=$(find / -name 'xdebug.so' 2> /dev/null)
XDEBUB_CONFIGURATION=$(cat <<EOF
[xdebug]
zend_extension='$XDEBUG_LOCATION'
xdebug.remote_enable = 1
xdebug.remote_handler = dbgp
xdebug.remote_host = 127.0.0.1
xdebug.idekey = PHPSTORM
xdebug.remote_autostart = 1
xdebug.remote_connect_back = 1
xdebug.max_nesting_level  = 200
EOF
)

echo "$XDEBUB_CONFIGURATION" | tee -a /etc/php5/mods-available/xdebug.ini
ln -s /etc/php5/mods-available/xdebug.ini /etc/php5/apache2/conf.d/10-xdebug.ini