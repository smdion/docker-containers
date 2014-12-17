#!/bin/sh

while inotifywait -e modify /config; do
    sv down /etc/service/upsboard/
    sv up /etc/service/upsboard/
    echo "File in Config Folder Changed, Restarted"
done
