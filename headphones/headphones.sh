#!/bin/bash

exec /sbin/setuser nobody python /opt/headphones/Headphones.py -p 8181 --datadir=/config --nolaunch
