#! /bin/sh

set -e


mkdir -p /root/.config
[ ! -L /root/.config/beets ] && ln -s /config /root/.config/beets

/usr/sbin/sshd -D -p 4022
