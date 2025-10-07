#!/usr/bin/env bash

DEVICE="/org/freedesktop/UPower/devices/battery_hidpp_battery_0"

if upower -e | grep -q "$DEVICE"; then
  battery=$(upower -i $DEVICE |
    grep -oE '[0-9]+%' | tr -d '%')
  echo "{\"text\": \"󰦋 $battery%\", \"tooltip\": \"Mouse Battery\", \"class\": \"battery\"}"
else
  echo "{\"text\": \"\", \"tooltip\": \"Mouse Battery\", \"class\": \"battery\",}"
fi
