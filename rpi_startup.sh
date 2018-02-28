# Does all startup for a rpi usb hub (installs usbip and all modules, makes tunnels to guac server, and enables udev rules to bind devices)
sudo /usr/local/bin/ACG-USBIP-pi/enable_usbip_server.sh
if [ $# -eq 0 ] || [ $# == "--help" ] || [ $# == "-h" ]
then
    echo Please run with your Unique ID as the first and only argument
    exit
fi

if [ $1 -lt 0 ] || [ $1 -gt 255 ]
then
    echo Unique ID must be between 0-255
    exit
fi
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/update_tunnels.yml --ask-sudo-pass --extra-vars "vm_ip=$1"
ansible-playbook /usr/local/bin/ACG-USBIP-pi/playbooks/enable_udevrules.yml --ask-sudo-pass
echo You need to reboot in order to have some changes
