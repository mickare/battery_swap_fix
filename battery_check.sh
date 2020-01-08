#!/bin/sh

# Script to print the charge threshold values and the current capacity.

info() {
  bat=$1
  name=$(basename "$1")
  status=$(cat $bat/status)
  capacity=$(cat $bat/capacity)
  start=$(cat $bat/charge_start_threshold)
  stop=$(cat $bat/charge_stop_threshold)
  printf "%s: %-12.12s, capacity: %-10s, start: %-10s, stop: %s\n" \
	"$name" "$status" "$capacity" "$start" "$stop"
}

for bat in $(ls -d /sys/class/power_supply/BAT*); do
  info "$bat"
done
