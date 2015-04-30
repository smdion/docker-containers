#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get install -qy git
  rm -rf /opt/headphones
  git clone https://github.com/rembo10/headphones.git /opt/headphones/
  chown -R nobody:users /opt/headphones/
fi
