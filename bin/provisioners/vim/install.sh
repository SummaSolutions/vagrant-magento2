#!/usr/bin/env bash

apt-get -y install vim

mkdir /etc/vim/colors/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
cp ${DIR}obsidian2.vim /etc/vim/colors/obsidian2.vim

sed -i '/"syntax on/c syntax on\n colorscheme obsidian2' /etc/vim/vimrc