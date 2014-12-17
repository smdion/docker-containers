#!/bin/sh

while inotifywait -e modify /config; do
    service UnofficialDDNS restart
    echo "File in Config Folder Changed, Restarted"
done
