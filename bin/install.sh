#!/usr/bin/env bash

set -e
set -v
set -x

cat /etc/*release

#export PATH=$PATH:/usr/local/bin

wget  https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_linux_amd64.zip
unzip -d /usr/local/bin vagrant_2.1.2_linux_amd64.zip

ls -al /usr/local/bin

echo $PATH
vagrant list
