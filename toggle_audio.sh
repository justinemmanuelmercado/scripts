#!/bin/bash

hdmi="output:hdmi-stereo-extra1+input:analog-stereo"
speakers="output:analog-stereo+input:analog-stereo"
speaker_sink_name="alsa_output.pci-0000_00_1f.3.analog-stereo"

if [[ $(pacmd list | grep 'active profile' | grep hdmi) ]]; then
  pacmd set-card-profile 0 $speakers && 
  sleep 0.1
  if [[ $(pacmd list-sinks | grep headphones | grep 'available: yes') ]]; then
    port="analog-output-headphones"
    pacmd set-sink-port $speaker_sink_name $port
    notify-send "headphones used"
  else
    port="analog-output-speaker"
    pacmd set-sink-port $speaker_sink_name $port
    notify-send "laptop speakers used"
  fi
else
  pacmd set-card-profile 0 $hdmi
  notify-send "set to $hdmi"
fi