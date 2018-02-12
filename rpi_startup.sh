# Does all startup for a rpi usb hub (installs usbip and all modules, makes tunnels to guac server, and enables udev rules to bind devices)
sudo enable_usbip_server.sh
###UPDATE_TUNNELS TAKES AN ARGUMENT ###
sudo update_tunnels.sh
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/enable_udevrules.yml --ask-sudo-pass
echo You need to reboot in order to have some changes
