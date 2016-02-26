#!/bin/bash

#update to latest version
echo Updating FlexGet
pip install --upgrade setuptools
pip install --upgrade flexget
flexget -V

#start flexget
flexget daemon start
