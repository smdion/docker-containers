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

# Install ddclient
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
  apt-get update -q && \
  apt-get install -qy ddclient cpanminus make gcc && \
  rm -rf /var/lib/apt/lists/* && \
  mv /etc/ddclient.conf /etc/ddclient.conf-sample && \
  ln -s /config/ddclient.conf /etc/ddclient.conf

#Add required Dependencies for FreeDNS
RUN cpanm --sudo Digest::SHA1

#SET CONFIG directory
VOLUME /config

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add ddclient to runit
RUN mkdir /etc/service/upsboard
ADD ddclient.sh /etc/service/upsboard/run
RUN chmod +x /etc/service/upsboard/run
