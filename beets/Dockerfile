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

# install beets and dependecies
RUN apt-get install -qy --force-yes python-dev python-pip openssh-server mp3gain wget
RUN yes | pip install beets
RUN yes | pip install pyacoustid
RUN yes | pip install pylast
ADD src/fpcalc /usr/bin/fpcalc
ADD src/ffmpeg /usr/bin/ffmpeg
ADD src/ffprobe /usr/bin/ffprobe
ADD src/lame /usr/bin/lame
ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

VOLUME /config
VOLUME /opt/downloads/music
VOLUME /opt/tmp

EXPOSE 4022

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

ENTRYPOINT ["/start.sh"]
