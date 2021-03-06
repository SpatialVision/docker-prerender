FROM nodesource/trusty:0.12.7

MAINTAINER Corentin Kerisit "c@42.am"

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig \
    build-essential 

RUN mkdir /data

ADD ./package.json /data/package.json
RUN cd /data && npm install

ADD . /data/

CMD node /data/server.js
