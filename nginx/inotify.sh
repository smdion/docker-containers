#!/bin/sh

while inotifywait -e modify /nginxconf; do
    nginx -s stop
    nginx
    echo "File in Config Folder Changed, Restarted"
done
