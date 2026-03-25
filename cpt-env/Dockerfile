FROM ubuntu:22.04

COPY run.sh /run.sh
COPY octoperf_test_backup.json /octoperf_test_backup.json
USER root


RUN apt-get -y update && \
apt-get -y install sudo && \
apt-get -y install wget && \
apt-get -y install telnet && \
apt-get -y install mc && \
apt-get -y install nano && \
apt-get -y install curl && \
apt-get -y install net-tools && \
apt-get -y install iputils-ping && \
wget https://download.influxdata.com/influxdb/releases/influxdb2-client-2.7.5-linux-amd64.tar.gz && \
tar xvzf ./influxdb2-client-2.7.5-linux-amd64.tar.gz && \
sudo cp ./influx /usr/local/bin/


ENTRYPOINT ["bash","-x","/run.sh"]