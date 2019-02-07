#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
sudo chmod 400 /usr/local/bin/ACG-USBIP-pi/id_rsa
sudo mkdir /.ssh
sudo ssh-keyscan -H 204.197.1.140 >>/.ssh/known_hosts
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/update_tunnels.yml --ask-sudo-pass --extra-vars "vm_ip=$1"
