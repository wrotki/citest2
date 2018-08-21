#!/usr/bin/env bash

cat /etc/*releases
wget https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_linux_amd64.zip
unzip vagrant_2.1.2_linux_amd64.zip
vagrant list
