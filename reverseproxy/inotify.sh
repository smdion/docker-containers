#!/bin/sh

while inotifywait -e modify /config; do
    sv down /etc/service/apache/
    sv up /etc/service/apache/
    echo "File in Config Folder Changed, Restarted"
done
