FROM phusion/baseimage:0.9.11
MAINTAINER smdion <smdion@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN \
  usermod -u 99 nobody && \
  usermod -g 100 nobody

#Install HTPC Manager
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
  apt-get update -q && \
  apt-get install -qy python unrar wget python-psutil && \
  rm -rf /var/lib/apt/lists/* && \
  wget -P /tmp/ https://github.com/styxit/HTPC-Manager/archive/0.11.0.tar.gz && \
  tar -C /opt/ -xvf /tmp/0.11.0.tar.gz && \
  chown nobody:users /opt/HTPC-Manager-0.11.0

#Expose Ports
EXPOSE 8085

#Expose Config Folder
VOLUME /config

#Start HTPC Manager
CMD python /opt/HTPC-Manager-0.11.0/Htpc.py --datadir /config
