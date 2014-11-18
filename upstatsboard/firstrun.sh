#!/bin/bash

#Set log file to /config/logs
ls -s /config/logs/debug.log /opt/UpsBoard-0.2.1/logs/debug.log

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.js ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  wget -P /config/ https://raw.githubusercontent.com/lienma/UpsBoard/master/config.js-sample
  mv /config/config.js-sample /config/config.js
  chown nobody:users /config/config.js
fi
