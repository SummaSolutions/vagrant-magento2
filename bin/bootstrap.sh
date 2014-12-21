#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

PROVISIONERS_FOLDER="/vagrant/bin/provisioners/"

#Configure misc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc
sed -i "s/#alias ls='ls --color=auto'/alias ls='ls --color=auto'/g" /home/vagrant/.bashrc
sed -i "s/#alias ll='ls -l'/alias ll='ls -l'/g" /home/vagrant/.bashrc
sed -i "s/#alias la='ls -A'/alias la='ls -A'/g" /home/vagrant/.bashrc
sed -i "/#alias l='ls -CF'/alias l='ls -CF'/g" /home/vagrant/.bashrc

apt-get update
apt-get -y install curl git


provisioners=(percona-mysql php apache vim xdebug composer)
for i in "${provisioners[@]}"
do
    echo "[$0] Running install script for ${i}"
    source ${PROVISIONERS_FOLDER}${i}/install.sh
done