#!/bin/sh

while inotifywait -e modify /config --exclude config.yaml; do
    cron stop
    rm /root/crons.conf
    cp /config/crons.conf /root/crons.conf
    crontab /root/crons.conf
    cron
    echo "Changed cron"
done
