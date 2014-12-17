#!/bin/sh

while inotifywait -e modify /config; do
    sv down /etc/service/polipo/
    sv up /etc/service/polipo/
    echo "File in Config Folder Changed, Restarted"
done
