#!/bin/sh

while inotifywait -e modify /config; do
    killall -2 apache2
    exec /usr/sbin/apache2 -D FOREGROUND
    echo "File in Config Folder Changed, Restarted"
done
