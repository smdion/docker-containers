#!/bin/bash
#
# beets music tagger - remote-post-processing script
#
#
# $1 - Fullpath of directory to be processed.  eg./mnt/user/downloads/some.artist_some.album

# $7 - Status of post processing. 0 = OK, 1 = failed verification, 2 = failed unpack, 3 = 1+2

if [ ! -z $7 ] && [ $7 -gt 0 ]; then
    echo "post-processing failed, bypassing script"
    exit 1
fi

# process files
echo "--------------------------"
echo $(date)
echo "Starting SABbeets.sh for $(basename $1)"

sshpass -p screencast ssh root@localhost -p 4022 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /config/beets.sh $1
