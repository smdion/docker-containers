#!/bin/bash

# Does the user want the plex tree version
if [ -z "$NZBDRONE" ]; then
  echo "nzbdrone not requested"
else
  apt-get update
  apt-get install -qy git
  rm -rf /opt/maraschino
  git clone -b nzbdrone https://github.com/gugahoi/maraschino.git /opt/maraschino
fi

# Verify and create come directories
if [[ ! -e /config/logs ]]; then
  mkdir -p /config/logs
fi

if [[ ! -e /config/scripts ]]; then
  mkdir -p /config/scripts
fi
