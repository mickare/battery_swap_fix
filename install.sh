#!/bin/bash

# Require root user
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# Current dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Install script to set the 'charge_start_threshold'
cp "$DIR/battery_swap_fix.sh" /usr/local/bin/battery_swap_fix.sh
chmod 755 /usr/local/bin/battery_swap_fix.sh
chown root: /usr/local/bin/battery_swap_fix.sh

# Install service that watches start, shutdown and standby
cp "$DIR/battery_swap_fix.service" /etc/systemd/system/battery_swap_fix.service
chmod 644 /etc/udev/rules.d/20-battery_swap_fix.rules
chown root: /etc/udev/rules.d/20-battery_swap_fix.rules

# Install udev rule to listen for power events
cp "$DIR/20-battery_swap_fix.rules" /etc/udev/rules.d/20-battery_swap_fix.rules
chmod 644 /etc/udev/rules.d/20-battery_swap_fix.rules
chown root: /etc/udev/rules.d/20-battery_swap_fix.rules

# Enable service
systemctl enable battery_swap_fix.service
systemctl start battery_swap_fix.service

echo "Restart required!"
echo "\t'udev' reload required."
