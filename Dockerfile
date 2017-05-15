FROM ubuntu:xenial
MAINTAINER Yasuyuki YAMADA <yasuyuki.ymd@gmail.com>

RUN apt-get -y update && apt-get -y install openssh-server python rsyslog less vim sudo
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

COPY start.sh /
ENTRYPOINT ["/start.sh"]
