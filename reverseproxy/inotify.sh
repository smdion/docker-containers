#!/bin/sh

while inotifywait -e modify /config; do
    sudo svc -t /etc/service/apache
    echo "File in Config Folder Changed, Restarted"
done
