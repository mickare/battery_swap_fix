#!/bin/bash

# Require root user
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# Disable service
systemctl stop battery_swap_fix.service;
systemctl disable battery_swap_fix.service;

rm /usr/local/bin/battery_swap_fix.sh
rm /etc/systemd/system/battery_swap_fix.service
rm /etc/udev/rules.d/20-battery_swap_fix.rules

echo "Restart required!"
echo "\t`udev` reload required."
