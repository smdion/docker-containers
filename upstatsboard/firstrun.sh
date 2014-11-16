#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.js ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  wget -P /config/ https://raw.githubusercontent.com/lienma/UpsBoard/master/config.js-sample
  mv /config/config.js-sample /config/config.js
  chown nobody:users /config/config.js
fi

# Check if logs exists. If not, copy in the sample config
if [ -f /config/logs/debug.log ]; then
  echo "Using existing log file."
else
  echo "Creating log file"
	if [[ ! -e /config/logs ]]; then
		mkdir -p /config/logs
		chown nobody:users /config/logs
	fi
fi