#!/bin/sh

while inotifywait -e modify /config; do
    runsv /etc/service/apache/ -k
    runsv /etc/service/apache/
    echo "File in Config Folder Changed, Restarted"
done
