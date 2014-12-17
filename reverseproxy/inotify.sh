#!/bin/sh

while inotifywait -e modify /config; do
    killall -2 apache2
    killall -2 httpd
    exec /usr/sbin/apache2 -D FOREGROUND
    echo "File in Config Folder Changed, Restarted"
done
