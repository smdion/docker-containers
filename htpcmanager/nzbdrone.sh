#!/bin/bash

# Does the user want the nzbdrone tree version
if [ -z "$NZBDRONE" ]; then
  echo "nzbdrone not requested"
else
  apt-get install -qy git
  rm -rf /opt/HTPC-Manager-0.11.0
  git clone -b master2 https://github.com/Hellowlol/HTPC-Manager.git /opt/HTPC-Manager-0.11.0
fi
