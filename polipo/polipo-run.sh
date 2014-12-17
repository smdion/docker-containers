#!/bin/bash

umask 000
exec /sbin/setuser nobody polipo -c /config/polipo.conf
