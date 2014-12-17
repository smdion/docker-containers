#!/bin/sh

while inotifywait -e modify /config; do
    apachectl -k stop
    echo "File in Config Folder Changed, Restarted"
done
