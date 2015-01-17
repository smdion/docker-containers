#!/bin/sh

while inotifywait -e modify /config/crons.conf; do
    rm /root/crons.conf
    cp /config/crons.conf /root/crons.conf
    crontab /root/crons.conf
    cron
    echo "Changed cron"
done
