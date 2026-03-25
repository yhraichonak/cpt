#!/bin/sh
echo 'Telegraf setting up...'

while [ ! -f "/share/influxdb.env" ]; do
  echo -n "Influx DB token not yet determined. Waiting for 2 more seconds"
  sleep 2
done
source /share/influxdb.env set


sed -i -e "s/  token = .*/  token = \"$INFLUX_ADMIN_TOKEN\"/g" /share/telegraf.conf
nohup telegraf --config /share/telegraf.conf --watch-config inotify &
mongod --bind_ip_all