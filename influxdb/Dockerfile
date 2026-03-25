FROM influxdb:2.7.5

COPY entrypoint.sh /entrypoint.sh
USER root
ENTRYPOINT ["bash","-x","/entrypoint.sh"]