#!/bin/sh

while inotifywait -e modify /config; do
    killall -2 polipo
    umask 000
    exec /sbin/setuser nobody polipo -c /config/polipo.conf
    echo "File in Config Folder Changed, Restarted"
done
