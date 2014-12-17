#!/bin/sh

while inotifywait -e modify /config; do
    sv -d /etc/service/apache/
    sv -u /etc/service/apache/
    echo "File in Config Folder Changed, Restarted"
done
