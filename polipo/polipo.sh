#!/bin/bash

exec /sbin/setuser nobody polipo -c /config/polipo.conf daemonise=false
