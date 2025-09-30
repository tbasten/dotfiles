#!/usr/bin/env bash

battery=$(upower -i /org/freedesktop/UPower/devices/battery_hidpp_battery_0 |
  grep -oE '[0-9]+%' | tr -d '%')

echo "{\"text\": \"$battery%\", \"tooltip\": \"Mouse Battery\", \"class\": \"battery\"}"
