#!/bin/sh

echo "CPT environment preparation"

OCTOPERF_TEST="Scenario #1 - 1min - AT"
BEARER="XXXXX
echo "Preparing Octoperf tests"
curl -X 'PUT'   'https://api.octoperf.com/design/variables/lo_CX48BzynPYZfkL3Uq' -H 'accept: */*' -H 'Authorization: Bearer XXXXX' -H 'Content-Type: application/json' -d '{  "description": "",  "id": "lo_CX48BzynPYZfkL3Uq",  "name": "at_trigger",  "projectId": "BSruw44BqQahJeAt-mOY",  "userId": "B13yv44BafbDfoxhauJx",  "variable": {    "@type": "ConstantVariable",    "value": "regression1"}}'
curl -X 'GET'   'https://api.octoperf.com/runtime/scenarios/by-project/BSruw44BqQahJeAt-mOY'   -H 'accept: */*'   -H 'Authorization: Bearer XXXXXX'
curl -X 'POST' \
  'https://api.octoperf.com/runtime/scenarios/by-projects' \
  -H 'accept: */*' \
  -H "Authorization: Bearer $BEARER" \
  -H 'Content-Type: application/json' \
  -d '[
  "BSruw44BqQahJeAt-mOY"
]' | grep "$OCTOPERF_TEST"



if [ $? -eq 0 ]; then
  echo "Octoperf test $OCTOPERF_TEST already exists"
else
  echo "Need to create Octoperf test $OCTOPERF_TEST..."
#  source /share/influxdb.env set
#  echo $INFLUX_ADMIN_TOKEN
#  sed -i -e "s/API_TOKEN/$INFLUX_ADMIN_TOKEN/g" /octoperf_test_backup.json
#  sed
#  curl -X 'POST' \
#    'https://api.octoperf.com/runtime/scenarios' \
#    -H 'accept: */*' \
#    -H "Authorization: Bearer $BEARER" \
#    -H 'Content-Type: application/json' \
#    --data '@/octoperf_test_backup.json'
#curl -X 'POST' \
#  'https://api.octoperf.com/runtime/scenarios' \
#  -H 'accept: */*' \
#  -H 'Authorization: Bearer XXXXX' \
#  -H 'Content-Type: application/json' \
#  -d '{"userId":"B13yv44BafbDfoxhauJx","projectId":"BSruw44BqQahJeAt-mOY","id":"","name":"'"$OCTOPERF_TEST"'","description":"","tags":[],"created":1714000173053,"lastModified":1714000173053,"userLoads":[{"bandwidth":{"bitsPerSecond":0,"name":"UNLIMITED"},"browser":{"cache":{"cacheSize":5000,"clearCacheOnEachIteration":true,"useCacheControlHeaders":false},"cookies":{"clearOnEachIteration":true,"policy":"STANDARD"},"downloadResources":null,"keepAlive":null,"name":"","userAgent":""},"dns":{"clearEachIteration":false,"servers":[],"staticHosts":{}},"id":"363ee753-f8cd-44ec-ac1b-2f0b75483184","jtl":{"settings":["LATENCY","ENCODING","RESPONSE_CODE","RESPONSE_MESSAGE","LABEL","IS_SUCCESS","RECEIVED_BYTES_COUNT","CONNECT_TIME","HOSTNAME","TIMESTAMP","DATA_TYPE","ACTIVE_THREAD_COUNT","URL","ELAPSED_TIME","THREAD_NAME","SAMPLE_AND_ERROR_COUNTS","IDLE_TIME","SENT_BYTES_COUNT","ASSERTION_FAILURE_MESSAGE"],"type":"ALL"},"memory":{"vuMb":null},"name":"VU#3-LONG","playwright":null,"properties":{"map":{}},"providerId":"WDutxI4BpvKc_UBSSge0","region":"default","setUp":null,"strategy":{"@type":"UserLoadOctoPerf","iterations":null,"onSampleError":"CONTINUE","points":[{"threadsCount":0,"timeInMs":0},{"threadsCount":26,"timeInMs":20000},{"threadsCount":40,"timeInMs":140000},{"threadsCount":40,"timeInMs":420000},{"threadsCount":50,"timeInMs":480000},{"threadsCount":50,"timeInMs":980000},{"threadsCount":4,"timeInMs":1100000},{"threadsCount":4,"timeInMs":1140000}]},"tearDown":null,"thinktime":{"pacing":null,"thinktime":null},"virtualUserId":"SjozxI4BpvKc_UBSPeSF"}],"mode":"STANDARD","backendListeners":{"listeners":[{"@type":"InfluxDBBackendListener","application":"CPT","customTags":{},"eventTags":{},"measurement":"jmeter","metricsSender":"org.apache.jmeter.visualizers.backend.influxdb.HttpMetricsSender","percentiles":[80,90,95,99],"samplersRegexp":".*","summaryOnly":false,"token":{"type":"ENCRYPTED","value":"'"$INFLUX_ADMIN_TOKEN"'"},"url":"http://influxdb:8086/api/v2/write?org=Forte&bucket=CPT"}],"queueSize":5000}}'
fi

sleep infinity