FROM ubuntu:latest

MAINTAINER Adam Crow <adamcrow63@gmail.com>

EXPOSE 53/udp 53/tcp

RUN apt-get update -q -q && \
 apt-get install pdns-server --yes --force-yes && \
 echo 'bind-check-interval=3600' >> /etc/powerdns/pdns.d/pdns.simplebind

COPY ./etc /etc
