#!/bin/bash
#Enable USBIP

# This just installs usbip and adds kernel modules,
# it is ***not*** a complete package.
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
echo "enabling USB IP kernel modules..."
sudo modprobe usbip-host > /dev/null &
sudo modprobe usbip-core > /dev/null &
sudo modprobe vhci-hcd > /dev/null &
wait
echo "USB IP kernel modules enabled!"

echo "Check whether kernel modules actually got enabled!"
lsmod | grep usbip

echo "Adding kernel modules to /etc/modules"
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/rpi_modules.yml --ask-sudo-pass
echo "Kernel modules added!"

echo "Starting USB IP daemon..."
sudo usbipd -D > /dev/null &
echo "USB IP daemon started!"

echo "If all looks good, continue setup. If not, something went wrong.\n Either way, bailing out."
