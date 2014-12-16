#!/bin/sh

while inotifywait -e modify /config; do
    s/etc/init.d/ddclient restart
    echo "File in Config Folder Changed, Restarted"
done
