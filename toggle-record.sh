#!/bin/bash

# File paths
OUTPUT_FILE="$HOME/Videos/video.mp4"
PID_FILE="/tmp/gpu_screen_recorder.pid"
STATUS_FILE="/tmp/gpu_screen_recorder.status"

# Check if recording is already running
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null; then
        echo "Stopping recording..."
        kill "$PID"
        rm "$PID_FILE"
        echo " Idle" > "$STATUS_FILE"
        notify-send "Screen Recorder" "Recording stopped."
        exit 0
    else
        rm "$PID_FILE"
    fi
fi

# Start recording
echo "Starting recording..."
notify-send "Screen Recorder" "Recording started."
sudo gpu-screen-recorder -w screen -f 60 -a default_output -o "$OUTPUT_FILE" &
RECORDER_PID=$!
echo "$RECORDER_PID" > "$PID_FILE"
echo " Recording" > "$STATUS_FILE"
