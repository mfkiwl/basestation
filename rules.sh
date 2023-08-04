#!/bin/bash
echo  'KERNEL=="ttyUSB*", KERNELS!="1-5", ATTRS{idVendor}=="0557", ATTRS{idProduct}=="2008", MODE:="0666", GROUP:="dialout",  SYMLINK+="battery"' > /etc/udev/rules.d/battery.rules

sudo udevadm control --reload
sudo udevadm trigger
