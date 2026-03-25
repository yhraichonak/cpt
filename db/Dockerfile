FROM mongo:6

USER root
RUN apt-get update && \
    apt-get install -y jq telnet  net-tools inetutils-ping mc nano wget telegraf bash

COPY ./run.sh /run.sh
EXPOSE 27017

ENTRYPOINT ["bash","-x","/run.sh"]