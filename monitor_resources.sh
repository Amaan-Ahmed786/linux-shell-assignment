#!/bin/bash
# monitor_resources.sh
# Purpose: Log CPU and memory usage at regular intervals
# Author: Amaan Ahmed
# Date: 2025-11-18

# Usage: ./monitor_resources.sh /path/to/logfile interval_seconds

LOGFILE="$1"
INTERVAL="${2:-60}"  # default to 60 seconds if not provided

if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 /path/to/logfile [interval_seconds]"
  exit 1
fi

mkdir -p "$(dirname "$LOGFILE")"

while true; do
  TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
  # CPU usage summary from top (1 iteration, batch mode), show average CPU line
  CPU_LINE=$(top -bn1 | grep "Cpu(s)" || top -bn1 | head -n 3 | tail -n 1)
  # Memory usage from free
  MEM_LINE=$(free -m | awk 'NR==2{printf "Mem: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')

  echo "$TIMESTAMP | $CPU_LINE | $MEM_LINE" >> "$LOGFILE"
  sleep "$INTERVAL"
done
