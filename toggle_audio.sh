#!/bin/bash

hdmi="output:hdmi-stereo-extra1+input:analog-stereo";
speakers="output:analog-stereo+input:analog-stereo"
if [[ $(pacmd list | grep 'active profile' | grep hdmi) ]]; then             
  sleep 2
  pacmd set-card-profile 0 $speakers
  echo "set to $speakers"
else
  sleep 2
  pacmd set-card-profile 0 $hdmi
  echo "set to $hdmi"
fi