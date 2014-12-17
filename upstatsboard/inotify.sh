#!/bin/sh

while inotifywait -e modify /config; do
    killall -2 node
    nodejs /opt/UpsBoard-0.2.1/app.js
    echo "File in Config Folder Changed, Restarted"
done
