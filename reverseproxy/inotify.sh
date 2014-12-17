#!/bin/sh

while inotifywait -e modify /config; do
    runsv  -x /etc/service/apache/
    runsv  -u /etc/service/apache/
    echo "File in Config Folder Changed, Restarted"
done
