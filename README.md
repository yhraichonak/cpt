# CPT - Continuous Performance Testing Framework MVP
## <ins>[CPT Framework Presentation (PDF)](CPT%20-%20Demo%20-%20uv.pdf)
##  <ins>[Architecture](https://drive.google.com/file/d/1E9mTDnDnQkk8gp-2cj_j2VHO6x6mOM84/view?usp=sharing):

![CPT.drawio.png](img/readme/CPT.drawio.png)

### <ins>Deployment steps:</ins>
 __Prerequesites:__<br/>
 __a. OS: Linux/Mac with Shell support__<br/>
 __b. Architecture: Intel-based__<br/>
 __c. TODO: check supprt of AppleSilicon-based Mac and Widows OS__<br/>


 __1. Install Docker Engine__<br/>
 __2. Install Docker-Compose__<br/>
 __3. Checkout sources of CPT__<br/>
 __4. From the root of the project run `./deploy.sh`__ or <br/>`docker-compose build --no-cache`<br/>`docker-compose up -d`</br>
  <ins>NOTE:</ins> to build just one container use `docker build . --no-cache -t jenkins`


![img_1.png](img/readme/img_1.png)

 __5. Wait until deployment is finished (around 60 sec) and all the containers up and running__
![img_2.png](img/readme/img_2.png)

CPT services after deployment:

 System        | URL                    | Details        
---------------|------------------------|---------------- 
| Jenkins       | http://localhost:8080/ | admin/admin    |
| ToDo test App | http://localhost:3000/ |                |
| Grafana       | http://localhost:4000/ | admin/password |
| Influx DB     | http://localhost:8086/ | admin/admin    |
----
## Next steps:
### [CPT - CI/CD integration](README_CI.md)<br/><br/> [CPT - Grafana Dasboards](README_DASHBOARDS.md)