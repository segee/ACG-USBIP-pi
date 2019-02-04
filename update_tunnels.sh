#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/update_tunnels.yml --ask-sudo-pass --extra-vars "vm_ip=$1"
