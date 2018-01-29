#!/bin/bash
#Enable USBIP

# This just installs usbip and adds kernel modules,
# it is ***not*** a complete package.

echo "enabling USB IP kernel modules..."
sudo modprobe usbip > /dev/null &
sudo modprobe usbip_common_mod > /dev/null &
wait
echo "USB IP kernel modules enabled!"

echo "Check whether kernel modules actually got enabled!"
lsmod | grep usbip

echo "Adding kernel modules to /etc/modules"
sudo echo "usbip" >> /etc/modules
sudo echo "usbip_common_mod" >> /etc/modules
echo "Kernel modules added!"

echo "Starting USB IP daemon..."
sudo usbip -D > /dev/null &
echo "USB IP daemon started!"

echo "If all looks good, continue setup. If not, something went wrong.\n Either way, bailing out."
