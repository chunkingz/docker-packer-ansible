#!/usr/bin/env bash

# Update OS, install python3 and ansible.
sudo apt update
sudo apt upgrade -y
sudo apt install python3-pip -y
sudo pip3 install ansible
sudo apt install ansible -y

# Install Packer
sudo apt install curl -y
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
sudo DEBIAN_FRONTEND=noninteractive apt install -y tzdata
sudo apt install software-properties-common -y
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install packer -y
