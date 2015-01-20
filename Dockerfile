FROM ubuntu:latest

MAINTAINER Adam Crow <adamcrow63@gmail.com>

ENV MYSQL_HOST 127.0.0.1 
ENV MYSQL_PORT 3306
ENV MYSQL_DBNAME pdns
ENV MYSQL_DBUSER pdns
ENV MYSQL_DBPASS asdf1234 
ENV RECURSOR1 8.8.8.8
ENV RECURSOR2 8.8.4.4
ENV ALLOW_RECURSION_MASK 0.0.0.0\/0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q -q && \
 apt-get install pdns-server pdns-backend-mysql  --yes --force-yes && \
 echo 'bind-check-interval=3600' >> /etc/powerdns/pdns.d/pdns.simplebind
RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh

CMD ["/etc/init.d/pdns", "monitor"]

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 53/udp 53/tcp
