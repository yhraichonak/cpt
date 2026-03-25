FROM octoperf/docker-agent:14.4.1
COPY run.sh /run.sh
USER root
RUN apt-get -y update && \
apt-get -y install sudo && \
apt-get -y install wget && \
apt-get -y install telnet && \
apt-get -y install mc && \
apt-get -y install nano && \
apt-get -y install net-tools && \
apt-get -y install iputils-ping