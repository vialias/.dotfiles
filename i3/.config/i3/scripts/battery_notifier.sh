# #!/usr/bin/env bash
#
# # Path to your battery; adjust if needed (e.g. BAT1)
# BAT_PATH="/sys/class/power_supply/BAT1"
#
# # Read current capacity and status
# capacity=$(<"$BAT_PATH"/capacity)      # e.g. "14"
# status=$(<"$BAT_PATH"/status)          # e.g. "Discharging"
#
# # Only notify when discharging and below threshold
# threshold=36
#
# if [[ "$status" == "Discharging" && "$capacity" -le "$threshold" ]]; then
#     # -u critical sets highest urgency; you can choose low/normal
#     # -h int:value adds a progress‐bar in some notification UIs
#     notify-send \
#       -u critical \
#       "Battery low: ${capacity}%" \
#       "Please plug in soon." \
#       -h int:value:"${capacity}"
# fi
#
#!/usr/bin/env bash
LOG="$HOME/.cache/battery_notifier.log"
BAT_DIR="/sys/class/power_supply/BAT1"   # ← adjust if yours is BAT1, BAT2, etc.

# Read values
capacity=$(<"$BAT_DIR/capacity")
status=$(<"$BAT_DIR/status")

# Log what we see
echo "$(date +'%F %T') status=$status cap=$capacity%" >> "$LOG"

threshold=15

if [[ "$status" == "Discharging" && "$capacity" -le "$threshold" ]]; then
  notify-send -u critical "Battery low "Plug in soon."
  echo "$(date +'%F %T') SENT notification" >> "$LOG"
else
  echo "$(date +'%F %T') no notif" >> "$LOG"
fi

