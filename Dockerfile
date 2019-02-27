FROM ubuntu:bionic
MAINTAINER Taichi MIYA <tmiya@protonmail.ch>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unbound && \
    rm -rf \
        /var/lib/apt/lists/* \
        /etc/apt/apt.conf.d/docker-gzip-indexes

COPY ./init.sh /sbin/init.sh
RUN chmod 700 /sbin/init.sh

EXPOSE 53/tcp 53/udp
VOLUME ["/etc/unbound"]

ENTRYPOINT ["/sbin/init.sh"]
CMD ["unbound"]
