#!/bin/bash
# backup_directory.sh
# Purpose: Create a timestamped backup of a specified directory
# Author: Amaan Ahmed
# Date: 2025-11-18

# Usage: ./backup_directory.sh /path/to/source /path/to/backup_root

SOURCE_DIR="$1"
BACKUP_ROOT="$2"

# Validate inputs
if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_ROOT" ]; then
  echo "Usage: $0 /path/to/source /path/to/backup_root"
  exit 1
fi

# Ensure source exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory $SOURCE_DIR does not exist."
  exit 2
fi

# Create backup root if missing
mkdir -p "$BACKUP_ROOT"

# Create timestamp and backup path
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BASENAME=$(basename "$SOURCE_DIR")
DEST="$BACKUP_ROOT/${BASENAME}_backup_$TIMESTAMP.tar.gz"

# Create compressed tarball
tar -czf "$DEST" -C "$(dirname "$SOURCE_DIR")" "$BASENAME"

if [ $? -eq 0 ]; then
  echo "Backup successful: $DEST"
else
  echo "Backup failed"
  exit 3
fi
