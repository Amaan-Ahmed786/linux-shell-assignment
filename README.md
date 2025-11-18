# Linux Shell Assignment

## Project Overview
This repository contains shell scripts and documentation for the assignment "Basics of Linux and Open-Source Tools". The scripts demonstrate backups, resource monitoring, and automated downloads.

## Files
- `backup_directory.sh` — Create timestamped backups of a directory.
- `monitor_resources.sh` — Continuously log CPU and memory usage to a file.
- `automated_download.sh` — Download files from the internet using wget/curl.
- `screenshots/` — Folder with screenshots showing command outputs and script runs.

## How to Run
1. Make scripts executable:
   ```bash
   chmod +x *.sh
   ```
2. Run examples:
   - `./backup_directory.sh /path/to/source /path/to/backups`
   - `nohup ./monitor_resources.sh ~/logs/resource_log.txt 60 &`
   - `./automated_download.sh https://example.com/file.csv ~/downloads`

## Notes
- Tested on Ubuntu 20.04 / 22.04.
- Ensure `wget` or `curl` is installed for downloads.

## Author
Amaan Ahmed — Student, B.Tech CSE (AI & Robotics)
