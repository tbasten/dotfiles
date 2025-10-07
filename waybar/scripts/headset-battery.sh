#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=en_US.UTF-8

DEVICE="/org/freedesktop/UPower/devices/headset_dev_0B_3A_DC_B9_A8_D1"

if upower -e | grep -qF "$DEVICE"; then
  battery=$(upower -i "$DEVICE" | grep -oE '[0-9]+%' | tr -d '%')
  # include the icon key only when connected
  printf '{"text":"󰋋 %s%%","tooltip":"Headset Battery","class":"battery","icon":"headset"}\n' "$battery"
else
  # omit the icon key when not connected
  printf '{"text":"","tooltip":"Headset Battery","class":"battery"}\n'
fi
