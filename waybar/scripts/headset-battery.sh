#!/usr/bin/env bash

battery=$(upower -i /org/freedesktop/UPower/devices/headset_dev_0B_3A_DC_B9_A8_D1 |
  grep -oE '[0-9]+%' | tr -d '%')

echo "{\"text\": \"$battery%\", \"tooltip\": \"Headset Battery\", \"class\": \"battery\"}"
