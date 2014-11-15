docker-upstatsboard
==================

This is a Dockerfile setup for UpStatsBoard v0.2.1. Built-in updater to go to current release - https://github.com/lienma/UpsBoard

All fields of /config/config.js must be filled out completely or deleted if not used.  This project is VERY picky about syntax being correct.  Make sure there are commas where there suppose to be and no blank fields.

Accessible at 0.0.0.0:8024 with correctly working config.  Logs output through docker if "runningmode" is set to debug in config.js

    docker run -v /path/to/config:/config -p 8024:8024 -d --name upstatsboard smdion/docker-upstatsboard
