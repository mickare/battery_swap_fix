#!/bin/bash

CHOICE=0	# 0=Power, 1=Battery
SWAP_THRESHOLD=5

if [ "$#" -eq 0 ]; then
	CHOICE=$(on_ac_power; echo $?)
else
	if [ "$1" == "1" ]; then CHOICE=1; else CHOICE=0; fi
fi

# Set the threshold
charge_start_threshold=0
if [ "$CHOICE" -eq 0 ]; then
	echo "Battery-Swap-Fix: Charging Mode"
	charge_start_threshold=0
else
	echo "Battery-Swap-Fix: Battery Swap Mode"
	charge_start_threshold=$SWAP_THRESHOLD
fi

# Apply threshold to all batteries
for bat in $(ls -d /sys/class/power_supply/BAT*); do
	echo "$charge_start_threshold" > ${bat}/charge_start_threshold
done
