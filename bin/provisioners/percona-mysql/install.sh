#!/usr/bin/env bash
apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
echo "deb http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list
apt-get update
apt-get -y install percona-server-server-5.6 percona-server-client-5.6