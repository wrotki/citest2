#!/usr/bin/env bash

set -e
set -v
set -x

cat /etc/*release

wget  https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_linux_amd64.zip
sudo unzip -d /usr/local/bin vagrant_2.1.2_linux_amd64.zip

vagrant plugin install pkg-config
vagrant plugin install vagrant-aws
