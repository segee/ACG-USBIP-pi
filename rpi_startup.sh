# Does all startup for a rpi usb hub (installs usbip and all modules, makes tunnels to guac server, and enables udev rules to bind devices)
sudo enable_usbip_server.sh
sudo update_tunnels.sh
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/enable_udevrules.yml --ask-sudo-pass
