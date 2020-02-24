#!/bin/bash
#
# usage: sudo bash kvm-change-hostname new-hostname
#

# check if argument is empty
if [ -z $1 ]; then
  echo "usage: sudo bash kvm-change-hostname new-hostname"
  exit
fi

echo "Change hostname to $1?"
read -p "Press Ctrl-C to cancel or press Enter to continue" -n 1
echo

sed -i '/preserve_hostname: false/c\preserve_hostname: true' /etc/cloud/cloud.cfg
hostnamectl set-hostname "$1"
sed -i 's/127.0.1.1.*/127.0.1.1\t'"$1"'/g' /etc/hosts

echo "Need Reboot to take effect, reboot NOW?"
read -p "Press Ctrl-C to cancel or press Enter to continue" -n 1
echo

sync;sync;reboot

