#!/bin/sh

while inotifywait -e modify /config; do
    runsv /etc/service/apache/ -x
    runsv /etc/service/apache/ -u
    echo "File in Config Folder Changed, Restarted"
done
