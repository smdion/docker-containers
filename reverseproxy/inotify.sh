#!/bin/sh

while inotifywait -e modify /config; do
    runsv /etc/services/apache/ -k
    runsv /etc/services/apache/
    echo "File in Config Folder Changed, Restarted"
done
