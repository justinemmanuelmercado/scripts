#!/bin/bash
change=$1
echo $change
min=0
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

echo $max
brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
echo $brightness

new=$(($brightness + $change))
echo $new

if (($new < $min)); then  
        let brightness=$min
elif  (($new > $max)); then
        let brightness=$max
else
        let brightness=$new
fi

echo $brightness > /sys/class/backlight/intel_backlight/brightness | bash #or zsh, csh or whateva
