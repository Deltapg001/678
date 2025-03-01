#!/bin/bash

# Start ninja.py in the Background
python3 ninja.py &
NINJA_PID=$!  # Get the Process ID of ninja.py

echo "✅ ninja.py is running with PID: $NINJA_PID"

# Periodically print logs to bypass 180s timeout
while kill -0 $NINJA_PID 2>/dev/null; do  # Check if ninja.py is still running
    echo "[$(date +'%T')] ninja.py is still running... 🔥" >> alive.log  # Log to File
    echo "Bot is Running... 🔥"  # Console Print
    sync  # Force Disk Sync to Bypass 7200s Timeout
    sleep 175  # Every 175 Seconds
done

# Log if Bot is Stopped
echo "❌ ninja.py Exited with Status $?"
