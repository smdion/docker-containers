#!/bin/bash

if ps aux | grep "UnofficialDDNS" > /dev/null
then
    echo "Running"
else
    service UnofficialDDNS start
    echo "Started Service"
fi
