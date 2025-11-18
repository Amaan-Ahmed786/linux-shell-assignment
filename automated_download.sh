#!/bin/bash
# automated_download.sh
# Purpose: Download a file from a URL and store it in a predefined directory
# Author: Amaan Ahmed
# Date: 2025-11-18

# Usage: ./automated_download.sh <URL> /path/to/destination_dir

URL="$1"
DEST_DIR="$2"

if [ -z "$URL" ] || [ -z "$DEST_DIR" ]; then
  echo "Usage: $0 <URL> /path/to/destination_dir"
  exit 1
fi

mkdir -p "$DEST_DIR"
FILENAME=$(basename "$URL")
DEST_PATH="$DEST_DIR/$FILENAME"

# Use wget if available, otherwise fallback to curl
if command -v wget >/dev/null 2>&1; then
  wget -O "$DEST_PATH" "$URL"
elif command -v curl >/dev/null 2>&1; then
  curl -L "$URL" -o "$DEST_PATH"
else
  echo "Neither wget nor curl is installed."
  exit 2
fi

if [ $? -eq 0 ]; then
  echo "Download completed: $DEST_PATH"
else
  echo "Download failed"
  exit 3
fi
