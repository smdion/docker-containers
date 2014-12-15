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

#Install DDNSnix
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
  apt-get update -q && \
  apt-get install -qy python wget && \
  wget -P /tmp/ https://github.com/Robpol86/UnofficialDDNSnix/releases/download/v1.0.0/unofficialddns_1.0.0_all.deb && \
  dpkg -i /tmp/unofficialddns_1.0.0_all.deb && \
  rm /tmp/unofficialddns_1.0.0_all.deb && \
  cp /etc/UnofficialDDNS.yaml /etc/UnofficialDDNS-dist.yaml && \
  rm /etc/UnofficialDDNS.yaml

#Add Config Volume
VOLUME /config
  
RUN \
  ln -s /config/UnofficialDDNS.yaml /etc/UnofficialDDNS.yaml

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add htpcmanager to runit
RUN mkdir /etc/service/ddnsnix
ADD ddnsnix.sh /etc/service/ddnsnix/run
RUN chmod +x /etc/service/ddnsnix/run
