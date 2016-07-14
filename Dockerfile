FROM ubuntu:14.04
MAINTAINER Andrew Krug


RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common apt-transport-https
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:gift/stable
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install python-plaso
RUN DEBIAN_FRONTEND=noninteractive apt-get clean &&  rm -rf /var/cache/apt/* /var/lib/apt/lists/*

ADD ./docker-entrypoint.sh /
RUN chmod u+x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
