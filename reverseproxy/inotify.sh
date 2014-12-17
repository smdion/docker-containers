#!/bin/sh

while inotifywait -e modify /config; do
    runsv apache -k
    runsv apache
    echo "File in Config Folder Changed, Restarted"
done
