#!/usr/bin/env bash

cat /etc/*releases
sudo wget -O /usr/local/bin/vagrant_2.1.2_linux_amd64.zip https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_linux_amd64.zip
sudo unzip /usr/local/bin/vagrant_2.1.2_linux_amd64.zip
vagrant list
