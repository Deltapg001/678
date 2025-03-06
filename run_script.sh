#!/bin/bash

# Function to Keep Alive and Print Every 175 Seconds
keep_alive() {
  while true; do
    echo "🟢 Still Running - $(date)"
    echo "Bot is Running... 🔥"  # Console Print
    sync  # Force Disk Sync to Bypass 7200s Timeout
    sleep 175  # Print every 175 seconds
  done
}

# Auto-Restart Trick
while true; do
  echo "🚀 Starting Process at $(date)"
  nohup python3 ninja.py > output.log 2>&1 &  # Background Execution
  NINJA_PID=$!  # Get the Process ID of ninja.py
  echo "✅ ninja.py is running with PID: $NINJA_PID"

  keep_alive &  # Run Keep Alive Function in Background
  KEEP_ALIVE_PID=$!  # Get the Process ID of keep_alive

  wait $NINJA_PID  # Wait for ninja.py to finish
  echo "⚠️ Process Stopped, Restarting..."
  kill $KEEP_ALIVE_PID  # Stop the keep_alive function
  sleep 10  # 10 sec delay before restart
done
