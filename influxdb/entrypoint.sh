#!/bin/sh
rm -fr /share/influxdb.env
influxd 1> /root/influxdb.out 2>&1 &

echo "Waiting InfluxDB to start"

curl localhost:8086/ping
while [ $? -ne 0 ]; do
  echo -n "."
  sleep 2
  curl localhost:8086/ping
done
echo " "

cat /etc/influxdb2/influx-configs | grep Forte
if [ $? -eq 1 ]; then
 influx setup   --org Forte  --bucket CPT  --username admin   --password password   --force
fi

INFLUX_ADMIN_TOKEN=`influx auth list | awk '{ print $4}' | tail -n +2`
echo INFLUX_ADMIN_TOKEN=$INFLUX_ADMIN_TOKEN > /share/influxdb.env
if [ ! -z "$INFLUX_ADMIN_TOKEN" ]
then
  OCTOPERF_AUTH_HEADER="Authorization: Bearer XXXXX"
  OCTOPERF_INFLUX_TOKEN_VAIABLE_ID="14A2lo8B5otXWmwxUdhq"
  OCTOPERF_INFLUX_TOKEN_VAIABLE="influx_token"
  OCTOPERF_PROJECT_ID="BSruw44BqQahJeAt-mOY"
  OCTOPERF_USER_ID="B13yv44BafbDfoxhauJx"
  curl -X 'PUT' "https://api.octoperf.com/design/variables/$OCTOPERF_INFLUX_TOKEN_VAIABLE_ID" -H 'accept: */*' -H "$OCTOPERF_AUTH_HEADER" -H 'Content-Type: application/json' -d "{\"id\":\"$OCTOPERF_INFLUX_TOKEN_VAIABLE_ID\",\"projectId\":\"$OCTOPERF_PROJECT_ID\",\"userId\":\"$OCTOPERF_USER_ID\",\"name\":\"$OCTOPERF_INFLUX_TOKEN_VAIABLE\",\"description\":\"\",\"variable\":{\"value\":{\"value\":\"$INFLUX_ADMIN_TOKEN\",\"type\":\"PLAIN\"},\"@type\":\"SecretVariable\"}}"
fi

wait $!