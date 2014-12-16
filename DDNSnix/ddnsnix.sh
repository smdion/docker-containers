#!/bin/bash

if ps aux | grep "UnofficialDDNS" > /dev/null
then
    : 
else
    service UnofficialDDNS start
    echo "Started Service"
fi
