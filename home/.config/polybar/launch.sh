#!/bin/bash
killall -q polybar

if type "xrandr"; then
  m=$(xrandr --query | grep " connected" | grep "DP-0" | cut -d" " -f1)
    MONITOR=$m polybar --reload example --config="~/.config/polybar/config.ini" &
else
  polybar --reload example &
fi
