#!/bin/bash

# Does the user want the edge version
if [ -z "$EDGE" ]; then
  echo "edge not requested"
else
  pip uninstall beets
  pip install https://github.com/sampsyo/beets/tarball/master
fi
