#!/bin/sh

while inotifywait -e modify /config --exclude config.yaml; do
    rm /root/crons.conf
    cp /config/crons.conf /root/crons.conf
    crontab /root/crons.conf
    echo "Changed cron"
done
