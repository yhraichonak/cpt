# CPT - CI/CD integration
Jenkins CI is embedded into framework as separate Docker image and has preconfigured Octoperf and Test App integration.

#### 1. Login into Jenkins http://localhost:8080/login as <ins>admin\admin
![img_2.png](img/readme-cicd/img_2.png)
#### 2. Open CPT_Todo_App_Performance2 job configuration page
http://localhost:8080/job/CPT_Todo_App_Performance2/configure<br/>
Approve pipeline scripts

![img_3.png](img/readme-cicd/img_3.png)

#### 3. Click <ins>Build with Parameters</ins> for <ins>CPT_Todo_App_Performance2</ins> <br/>
Jenkins job loads the tests list in __scenario__ dropdown for CPT automation in hardcoded [Octoperf project](https://api.octoperf.com/ui/workspace/5Abuw44BzynPYZfkha0C/project/BSruw44BqQahJeAt-mOY/runtime/scenario) (see line 61 [CPT_Todo_App_Performance2.xml](jenkins/jobs/CPT_Todo_App_Performance2.xml)). __Measurement__ parameter is used as unique symbolic name/tag to distinguish one performance test run from another while building dashboards.

![img_6.png](img/readme-cicd/img_6.png)

#### 4. Trigger build <br/>
- Wait until it is finished (see link to Octoperf run in Console)
![img_8.png](img/readme-cicd/img_8.png)![img_9.png](img/readme-cicd/img_9.png)![img_10.png](img/readme-cicd/img_10.png)

#### 5. Open InfluxDB http://localhost:8086 and verify that reported metrics under Forte org and CPT bucket are coming with appropriate measurement/tag name
![img_11.png](img/readme-cicd/img_11.png)![img_12.png](img/readme-cicd/img_12.png)![img_13.png](img/readme-cicd/img_13.png)
Currently only CPU ant RAM are tracked as system metrics on SUT. But that could be customized/extended via [telegraf.conf](share/telegraf.conf) by enabling plugins and customizing tags

#### 6. Repeat steps 4-5 for few more performance tests