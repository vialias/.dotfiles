#!/usr/bin/env bash
# wait for X to settle
sleep 1

# get list of connected outputs
# assumes `primary` keyword is present for your primary monitor
primary=$(xrandr --query \
    | awk '/ connected primary/ {print $1}')
others=$(xrandr --query \
    | awk '/ connected/ {print $1}' \
    | grep -v "^${primary}$")

# kill any existing bars
killall -q polybar

# launch on primary
if [[ -n $primary ]]; then
  MONITOR=$primary polybar --reload primary &
fi

# launch on each secondary
for m in $others; do
  MONITOR=$m polybar --reload secondary &
done
	
