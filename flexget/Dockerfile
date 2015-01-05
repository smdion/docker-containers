FROM phusion/baseimage:0.9.15
MAINTAINER smdion <me@seandion.com>

ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN usermod -d /config nobody

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse" && \
    add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse" && \
    apt-get update -qq && \
    apt-get install -qq --force-yes python2.7 python-dev python-pip python-transmissionrpc && \
    apt-get autoremove && \
    apt-get autoclean && \
    pip install flexget

VOLUME /config
RUN ln -sf /config /root/.flexget

# Add flexget to runit
RUN mkdir /etc/service/flexget
ADD flexget.sh /etc/service/flexget/run
RUN chmod +x /etc/service/flexget/run
