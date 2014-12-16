#!/bin/sh

while inotifywait -e modify /config; do
    service apache2 restart
    echo "File in Config Folder Changed, Restarted"
done
