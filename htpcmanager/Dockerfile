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

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python unrar wget python-psutil

# Install HTPCManager v0.11.0
RUN wget -P /tmp/ https://github.com/styxit/HTPC-Manager/archive/0.11.0.tar.gz
RUN tar -C /opt/ -xvf /tmp/0.11.0.tar.gz
ADD . /opt/HTPC-Manager-0.11.0
RUN chown nobody:users /opt/HTPC-Manager-0.11.0

EXPOSE 8085

VOLUME /config

CMD python /opt/HTPC-Manager-0.11.0/Htpc.py --datadir /config
