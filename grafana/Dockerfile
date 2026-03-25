FROM grafana/grafana:10.3.5-ubuntu

USER root
RUN apt-get update && \
    apt-get install -y jq telnet  net-tools inetutils-ping mc nano wget

USER grafana

COPY ./run1.sh /run1.sh

ENTRYPOINT ["bash","-x","/run1.sh"]
