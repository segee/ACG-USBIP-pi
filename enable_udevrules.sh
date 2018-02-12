sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/enable_udevrules.yml --ask-sudo-pass
echo A reboot is needed for this change to take effect
#https://unix.stackexchange.com/questions/39370/how-to-reload-udev-rules-without-reboot

