#!/bin/bash
if [ $# -eq 0 ] || [ $# == "--help" ] || [ $# == "-h" ]
then
    echo Usage: update_tunnels.sh ip where ip is the least significant value of your VMs IP
    echo Ex: 192.168.0.92
    echo You would enter update_tunnels.sh 92
	exit
fi

if [ $1 -lt 0 ] || [ $1 -gt 255 ]
then
    echo Ip must be between 0-255
	echo Usage: update_tunnels.sh ip where ip is the least significant value of your VMs IP
	echo Ex: 192.168.0.92
	echo You would enter update_tunnels.sh 92
    exit
fi
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/update_tunnels.yml --ask-sudo-pass --extra-vars "vm_ip=$1"
