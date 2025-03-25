#!/bin/bash

# Check if OBS is recording
if obs-cmd recording status | grep -q "Recording: true"; then
    # If recording, stop recording and set L key to normal
    obs-cmd recording stop
    openrgb -p lav1
else
    # If not recording, start recording and set L key to red
    obs-cmd recording start
    openrgb -p lav2
fi
