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

# CentOS 7.5: ami-00f7c900d2e7133e1
# ECS AMI 300GB overlay: ami-01811acf3c02e823a
cat << EOF > ./Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "dummy"
  config.vm.provider "aws" do |aws,override|
    aws.access_key_id = "$ACCESS_KEY_ID"
    aws.secret_access_key = "$SECRET_ACCESS_KEY"
    aws.keypair_name = "TestKey"
    aws.instance_type = "t2.micro"
    aws.region = "us-west-2"
    aws.ami = "ami-00f7c900d2e7133e1"
    aws.subnet_id = "subnet-0435c4e57b336660d"
    aws.security_groups = ['sg-9555d5ef', 'sg-01d643a9f4402fa7d']
    aws.elastic_ip = "52.32.7.145"
    override.ssh.username = "centos"
    override.ssh.private_key_path = "~/.ssh/TestKey.pem"
    override.nfs.functional = false
  end
end
EOF

vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
vagrant up --provider=aws
