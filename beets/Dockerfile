FROM phusion/baseimage:0.9.15
MAINTAINER smdion <me@seandion.com>

ENV DEBIAN_FRONTEND noninteractive

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get -q update
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get -qy --force-yes dist-upgrade

RUN mkdir -p /root/.config
RUN ln -s /config /root/.config/beets

# install beets and dependecies
RUN apt-get install -qy --force-yes python-dev python-pip  mp3gain wget
RUN yes | pip install beets
RUN yes | pip install pyacoustid
RUN yes | pip install pylast
ADD src/fpcalc /usr/bin/fpcalc
ADD src/ffmpeg /usr/bin/ffmpeg
ADD src/ffprobe /usr/bin/ffprobe
ADD src/lame /usr/bin/lame

VOLUME ["/config", "/opt/downloads/music", "/opt/tmp"]

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh
