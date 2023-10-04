#!/bin/bash

swaymsg output HDMI-A-1 mode 2560x1440 scale 1
swaymsg output HDMI-A-1 position -2560 0
swaymsg '[workspace="3"] move workspace to output HDMI-A-1'
swaymsg '[workspace="4"] move workspace to output HDMI-A-1'
swaymsg '[workspace="5"] move workspace to output HDMI-A-1'
swaymsg '[workspace="6"] move workspace to output HDMI-A-1'
swaymsg '[workspace="7"] move workspace to output HDMI-A-1'
swaymsg '[workspace="8"] move workspace to output HDMI-A-1'
swaymsg '[workspace="10"] move workspace to output HDMI-A-1'
