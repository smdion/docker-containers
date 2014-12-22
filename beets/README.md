#docker beets

## Description:

This is a Dockerfile for "beets" - (http://beets.radbox.org/)
On github, in the src folder you will find "SABbeets.sh" which is the script that will run beets from this container.
It assumes you are running all containers with the network stack being shared with the host. Ensure you also copy "beets.sh"
to your config folder and that it is executable.

## Build from docker file:

```
git clone https://github.com/HurricaneHernandez/docker-beets.git 
cd docker-beets
docker build -t beets . 
```

## Volumes:

#### `/config`

Configuration and library databse location for beets. (i.e. /opt/appdata/beets)

#### `/opt/downloads/music`

Location of music. (i.e. /opt/downloads/music or /var/music)

#### `/opt/tmp`

Location of incomplete downloads, or incoming downloads, or music to be tagged. (i.e. /opt/tmp)


## Docker run command:

```
docker run -d --net=host -v /*your_config_location*:/config  -v /*your_musiclibrary_location*:/opt/downloads/music -v /*your_temp_location:/opt/tmp --name=beets hurricane/docker-beets
```
