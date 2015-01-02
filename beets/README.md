#docker beets

## Description:

This is a Dockerfile for "beets" - (http://beets.radbox.org/).  Access the files by using the Docker Exec command

#### `docker exec Beets beet`

## Volumes:

#### `/config`

Configuration and library databse location for beets. (i.e. /opt/appdata/beets)

#### `/opt/downloads/music`

Location of music. (i.e. /opt/downloads/music or /var/music)

#### `/opt/tmp`

Location of incomplete downloads, or incoming downloads, or music to be tagged. (i.e. /opt/tmp)


## Docker run command:

```
docker run -d --net=host -v /*your_config_location*:/config  -v /*your_musiclibrary_location*:/opt/downloads/music -v /*your_temp_location:/opt/tmp --name=beets smdion/docker-beets
```
