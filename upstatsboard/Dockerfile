FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

#add repositories
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN add-apt-repository ppa:dhor/myway
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy vnstat npm unrar wget graphicsmagick

# Install UpStatsBoard v0.2.1
RUN wget -P /tmp/ https://github.com/lienma/UpsBoard/archive/0.2.1.tar.gz
RUN tar -C /opt/ -xvf /tmp/0.2.1.tar.gz
RUN cd /opt/UpsBoard-0.2.1 && npm install
ADD . /opt/UpsBoard-0.2.1
RUN chown nobody:users /opt/UpsBoard-0.2.1

#Set config.js to under config
RUN ln -s /config/config.js /opt/UpsBoard-0.2.1/config.js

#SET CONFIG directory
VOLUME /config

#Set Log directory
VOLUME /opt/UpsBoard-0.2.1/logs

#Create vnstat database
RUN vnstat -u -i eth0

EXPOSE 8024

#set VNSTAT init script
ADD vnstat /tmp/vnstat
RUN cp /tmp/vnstat /etc/init.d
RUN service vnstat start

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add upsboard to runit
RUN mkdir /etc/service/upsboard
ADD upsboard.sh /etc/service/upsboard/run
RUN chmod +x /etc/service/upsboard/run
