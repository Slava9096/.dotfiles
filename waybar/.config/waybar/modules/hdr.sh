#!/bin/bash

MONITOR="HDMI-A-1"

# Get color format of my main monitor
CURRENT_FORMAT=$(hyprctl monitors | awk -v RS= "/^Monitor HDMI-A-1/" | sed -n "s/.*currentFormat: //p")

if [[ "$CURRENT_FORMAT" == *"XRGB2101010" ]]; then
    STATUS="hdr_on"
elif [[ "$CURRENT_FORMAT" == *"XRGB8888" ]]; then
    STATUS="hdr_off"
else
    STATUS="unknown"
fi

if [[ "$1" == "toggle" ]]; then
    if [[ "$STATUS" == "hdr_on" ]]; then
        hyprctl keyword monitor $MONITOR,2560x1440@144,0x0,1 > /dev/null
        STATUS="hdr_off"
    elif [[ "$STATUS" == "hdr_off" ]]; then
        hyprctl keyword monitor $MONITOR,2560x1440@144,0x0,1,bitdepth,10,cm,hdr > /dev/null
        STATUS="hdr_on"
    fi
fi

echo "{\"text\":\" \", \"alt\":\"$STATUS\"}"
