# CPT - Grafana Dasboards
Grafana Dashboard goes together with CPT as dockerized environment with few preconfigured dashboard for performance tests analysis
### <ins> Aggregated dashboard</ins><br>
__1. Login into Grafana http://localhost:4000/login as <ins>admin\password__ <br/>
__2. Go to Dashboard>Performance Testing Dashboards>CPT-Aggregated report__ <br/>
__3. Zoom in dashboard to see interested measurement in full width__
![img_15.png](img/readme-dashboard/img_15.png)
__4. Scroll down through the dashboard and review all the metrics recorded for target measurement__<br/> 
![img_16.png](img/readme-dashboard/img_16.png)
__5. Repeat steps 3-4 for other recorded measurements__
![img_17.png](img/readme-dashboard/img_17.png)
<ins>NOTE:</ins> to update list of metrics displayed on dashboard click "Edit" menu and disable not needed series
![img_18.png](img/readme-dashboard/img_18.png)
<ins>NOTE2:</ins> User can just temporary apply changes to the pre-configured dashboards as they were deployed via provisioning mechanism. If changes must be saved forever  - copy JSON configuration to clipboard and create a new dashboard based on the config 
![img_19.png](img/readme-dashboard/img_19.png)![img_20.png](img/readme-dashboard/img_20.png)
<ins>NOTE3:</ins> Currently list of measurements is hardcoded as static list of values under Variables section. If required the list of values could be dynamically loaded or extended with required values
![img_21.png](img/readme-dashboard/img_21.png)
----
### <ins> Comparison dashboard</ins><br>

__Go to Dashboard>Performance Testing Dashboards>CPT-Comparisson dashboard__ <br/>
There is no out-of box Grafana-based dashboard to compare timeshifted performance tests metrics
https://community.grafana.com/t/visualize-time-shifted-data/80285
Thus, feature is implemented via exporting time-shifted performance metrics into csv  and import via Grafana Infinity plugin.

 1. On Dashboard pick the range that will include both interested measurements (for ex regression1 and regression2)
 2. On panel "Regression runs comparisson (ALIGNED) [NO ZOOM]" click "Inspect" menu
![img_22.png](img/readme-dashboard/img_22.png)
 3. Export tabular data aggregated by timestamp as csv file
![img_26.png](img/readme-dashboard/img_26.png)
 4. On panel "Regression comparisson" click "Edit" menu. And upload just generated csv file 
![img_27.png](img/readme-dashboard/img_27.png)
5. Click Apply and Save.
6. On updated "Regression comparisson" panel click "Zoom to data". Aggregated results for selected measurements are loaded
![img_28.png](img/readme-dashboard/img_28.png)
7. To pick different measurements for comparisson - use dropdowns on the top
![img_29.png](img/readme-dashboard/img_29.png)
<ins>NOTE:</ins> Currently list of measurements is hardcoded as static list of values under Variables section. If required the list of values could be dynamically loaded or extended with required values
![img_30.png](img/readme-dashboard/img_30.png)