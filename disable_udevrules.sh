sudo apt-get update
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/disable_udevrules.yml --ask-sudo-pass
