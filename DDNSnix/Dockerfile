FROM phusion/baseimage:0.9.16
MAINTAINER smdion <me@seandion.com>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#Install DDNSnix
RUN \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
  add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
  add-apt-repository ppa:fkrull/deadsnakes && \
  apt-get update -q && \
  apt-get install -qy python inotify-tools python2.6 python2.6-dev wget && \
  wget -P /tmp/ https://github.com/Robpol86/UnofficialDDNSnix/releases/download/v1.0.0/unofficialddns_1.0.0_all.deb && \
  dpkg -i /tmp/unofficialddns_1.0.0_all.deb && \
  rm /tmp/unofficialddns_1.0.0_all.deb && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  mv /etc/UnofficialDDNS.yaml /etc/UnofficialDDNS-dist.yaml && \
  ln -s /config/UnofficialDDNS.yaml /etc/UnofficialDDNS.yaml
  
#Expose Volumes
VOLUME /config

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add inotify.sh to execute during container startup
RUN mkdir /etc/service/inotify
ADD inotify.sh /etc/service/inotify/run
RUN chmod +x /etc/service/inotify/run

# Add ddnsnix to runit
RUN mkdir /etc/service/ddnsnix
ADD ddnsnix-run.sh /etc/service/ddnsnix/run
RUN chmod +x /etc/service/ddnsnix/run
ADD ddnsnix-finish.sh /etc/service/ddnsnix/finish
RUN chmod +x /etc/service/ddnsnix/finish
