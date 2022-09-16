# Battery Swap Fix (Linux) for Lenovo T470s

> **Not needed anymore!**
>
> Please use the latest firmware to fix the battery issue.
> See: https://gitlab.freedesktop.org/upower/upower/-/issues/62

Scripts to automatically set `charge_start_threshold` to reasonable values, so the batteries are charged and switched correctly.

## Background
There is a bug either in the Linux kernel or the lenovo power management, that when not charging, only one battery is used and never the extra battery. 

When the first battery is empty the laptop can simply crash, since the Linux kernel thinks there is still more power, but some battery controller simply kills the power to protect the battery.

By enabling `charge_start_threshold`, by using a number greater than 0, the battery is correctly switched when that threshold is reached. But when the battery capacity is higher, then the battery won't charge.

This project tries to mitigate this dilema, by automatically setting the `charge_start_threshold` values accordingly to the current AC power status.

## Installation

To install run `sudo ./install.sh`.

To uninstall run `sudo ./uninstall.sh`.

In both cases your system could need a restart, so `udev` can reload the event monitoring rules correctly.

## Tested Devices:
- Lenovo T470s
