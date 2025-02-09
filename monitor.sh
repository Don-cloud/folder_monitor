#!/bin/bash 
WATCH_DIR="/incoming_folder"
mkdir -p $WATCH_DIR
inoticoming --initialsearch --logfile /tmp/filemonitor.log --foreground $WATCH_DIR ./handler.sh {} \;
#The `inoticoming` command is used to monitor the `/incoming_folder` directory for file creation events. When a file is created in the directory, the `handler.sh` script is executed with the path of the created file as an argument. The `handler.sh` script then appends a log message to `/tmp/event_log.txt` indicating that a file creation event was triggered for the specified file. This allows you to track file creation events in the monitored directory.