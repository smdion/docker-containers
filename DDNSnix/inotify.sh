#!/bin/sh

while inotifywait -e modify /config; do
    killall -2 UnofficialDDNS
    service UnofficialDDNS start
    echo "File in Config Folder Changed, Restarted"
done
