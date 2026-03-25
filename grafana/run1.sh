#!/bin/sh

echo "Waiting InfluxDB to start"

curl influxdb:8086/ping
while [ $? -ne 0 ]; do
  echo -n "."
  sleep 2
  curl influxdb:8086/ping
done
sleep 5

echo 'Copying Influx token'
source /share/influxdb.env set
sed -i -e "s/      token.*/      token: $INFLUX_ADMIN_TOKEN/g" /etc/grafana/provisioning/datasources/datasource.yaml

echo 'Starting Grafana...'
/run.sh "$@" &

echo "Waiting Grafaba to start"
curl http://localhost:3000/api/health
while [ $? -ne 0 ]; do
  echo -n "."
  sleep 2
  curl localhost:3000/api/health
done
curl -X 'PUT'  'http://admin:admin@localhost:3000/api/admin/users/1/password' -H 'accept: */*'  -H 'Content-Type: application/json' --data '{"password":"password"}'
wait $!