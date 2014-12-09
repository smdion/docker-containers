#!/bin/bash

# Does the user want the plex tree version
if [ -z "$EDGE" ]; then
  echo "edge not requested"
else
  apt-get install -qy git
  rm -rf /opt/HTPC-Manager-0.11.0
  git clone -b master https://github.com/styxit/HTPC-Manager.git /opt/HTPC-Manager-0.11.0
fi