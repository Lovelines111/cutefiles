#!/usr/bin/env bash
# Frozen screenshot with region selection

# Temporary files
SCREENSHOT_FILE="/tmp/screenshot-$(date +%s).png"
TMP_GEOMETRY="/tmp/screenshot-geometry-$(date +%s).txt"

# First take screenshot of entire screen
grim "$SCREENSHOT_FILE"

# Temporarily disable animations
hyprctl keyword animations:enabled 0

# Display the screenshot fullscreen using imv
imv-wayland "$SCREENSHOT_FILE" &
IMV_PID=$!

# Wait a moment for imv to open
sleep 0.5

# Get window ID of imv
IMV_WINDOW=$(hyprctl clients -j | jq -r '.[] | select(.class=="imv") | .address')

# Run slurp to get selection geometry
slurp -f "%wx%h+%x+%y" > "$TMP_GEOMETRY"

# Kill the imv preview
kill $IMV_PID

# Restore animations
hyprctl keyword animations:enabled 1

# Check if selection was made
if [ -s "$TMP_GEOMETRY" ]; then
    GEOMETRY=$(cat "$TMP_GEOMETRY")
    # Capture the selected region
    grim -g "$GEOMETRY" - | swappy -f -
fi

# Clean up
rm -f "$SCREENSHOT_FILE" "$TMP_GEOMETRY"
