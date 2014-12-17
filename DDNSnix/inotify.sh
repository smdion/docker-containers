#!/bin/sh

while inotifywait -e modify /config; do
    sv down /etc/service/ddnsnix/
    sv up /etc/service/ddnsnix/
    echo "File in Config Folder Changed, Restarted"
done
