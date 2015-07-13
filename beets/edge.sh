#!/bin/bash

# Does the user want the edge version
if [ -z "$EDGE" ]; then
  echo "edge not requested"
else
  apt-get install -qy git
  yes | pip uninstall beets
  rm -r beets
  git clone https://github.com/sampsyo/beets.git && cd beets && python setup.py install
fi
