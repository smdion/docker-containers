#!/bin/bash

# Does the user want the plex tree version
if [ -z "$EDGE" ]; then
  echo "edge not requested"
else
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
  apt-get update -q
  apt-get install -qy git
  rm -rf /opt/HTPC-Manager-0.11.0
  git clone -b master https://github.com/styxit/HTPC-Manager.git /opt/HTPC-Manager-0.11.0
fi
