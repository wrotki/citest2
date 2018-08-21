#!/usr/bin/env bash

set -e
set -v
set -x

cat /etc/*release

wget --quiet https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_linux_amd64.zip
sudo unzip -d /usr/local/bin vagrant_2.1.2_linux_amd64.zip

vagrant plugin install pkg-config
vagrant plugin install vagrant-aws

echo vagrant-aws plugin installation complete

cat << EOF > ./Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "dummy"
  config.vm.provider "aws" do |aws,override|
    aws.access_key_id = "$ACCESS_KEY_ID"
    aws.secret_access_key = "$SECRET_ACCESS_KEY"
    aws.keypair_name = "PolyverseDevelopmentKey"
    aws.instance_type = "t2.micro"
    aws.region = "us-west-2"
    aws.ami = "ami-01811acf3c02e823a"
    aws.subnet_id = "subnet-d51285b1"
    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = "~/.ssh/PolyverseDevelopmentKey.pem"
  end
end
EOF

vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
vagrant up --provider=aws
