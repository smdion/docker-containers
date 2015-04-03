FROM phusion/baseimage:0.9.15
MAINTAINER smdion <me@seandion.com>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Add our crontab file
ADD crons.conf /root/crons.conf

# Use the crontab file
RUN crontab /root/crons.conf

# Start cron
RUN cron

# Install PROGRAM
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q
RUN apt-get install -qy ruby ruby-dev git make gcc inotify-tools
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/bstascavage/plexReport.git /opt/plexReport
RUN cd /opt/plexReport/ && \
  gem install bundle && \
  bundle install
RUN cd /opt/plexReport/ && \
  ./initial_setup.sh
RUN rm /opt/plexReport/etc/config.yaml
RUN ln -s /config/config.yaml /opt/plexReport/etc/config.yaml
RUN ln -s /config/plexReport.log /opt/plexReport/plexReport.log
  
#Expose Volumes
VOLUME /config

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add inotify.sh to execute during container startup
RUN mkdir /etc/service/inotify
ADD inotify.sh /etc/service/inotify/run
RUN chmod +x /etc/service/inotify/run
