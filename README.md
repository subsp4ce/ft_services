# ft_services

Codam [42 Network] project: the aim of this project is to virtualize a network by setting up a multi-service cluster using Kubernetes.
<br/><br/>

### Specifications
- kubernetes web dashboard
- metallb load balancer with a single IP that is the only entrance to the cluster
- wordpress website listening on port 5050 that works with a mysql database and has it's own nginx server
- phpmyadminn listening on port 5000 that is linked with the mysql database and also has it's own nginx server
- nginx server listening on ports 80 and 443; port 80 (http) is a systematic redirection of type 301 to port 443 (https)
- FTPS server listening on port 21
- grafana platform listening on port 3000 linked with an influxdb database that monitors all your containers
- all containers must restart incase of a crash
- need to ensure that the database volumes are persistent, retaining data even incase of a container crashing
<br/><br/>
![map](https://github.com/subsp4ce/pics/blob/master/ft_services_map.png "map")
<br/><br/>

### Instructions
- run `sh setup.sh`
- the kubernetes dashboard will launch automatically in your browser
- to access services you can navigate to http://192.168.99.120 for instructions or read below
- **WORDPRESS**
    -  visit wordpress via port 5050 http://192.168.99.120:5050/
    -  visit wordpress via nginx redirect 307 https://192.168.99.120/wordpress/
    -  Logins - user:password, nilo:password, brit:password, tessa:password
- **PHPMYADMIN**
    - visit phpmyadmin via port 5000 http://192.168.99.120:5000/
    - visit phpmyadmin via nginx reverse proxy https://192.168.99.120/phpmyadmin/
    - Login - mysql:password
- **SSH**
    -  in terminal enter: ssh user@192.168.99.120
    -  password = password
    -  you may need to delete the known host first at .ssh/knownhosts
- **GRAFANA**
    - visit grafana dashboard http://192.168.99.120:3000/
    - Login - admin:admin
- **FTPS**
    - Open Filezilla and connect with these credentials:
    - Host: 192.168.99.120
    - Username: user
    - Password: password
    - Port: 21
- when done run `sh clean_minikube`
<br/><br/>

### General information
- `Docker` is a program that performs operating-system-level virtualization, also known as “containerization”
- `kubernetes` is a portable, extensible, open-source platform for managing containerized workloads and services (ie: Docker containers)
- `kubectl`is kubernetes' command-line tool which allows you to run commands against Kubernetes clusters
- `minikube` is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node
<br/><br/>

### Skills
- Network & system administration
<br/><br/>

### Objectives
- System administration
<br/><br/>

![Trees](https://github.com/subsp4ce/pics/blob/master/pexels-skitterphoto-240040.jpg "Trees")
