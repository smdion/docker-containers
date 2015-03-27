#!/bin/sh

while inotifywait -e modify /config; do
    sv hup ddclient
    echo "File in Config Folder Changed, Restarted"
done
