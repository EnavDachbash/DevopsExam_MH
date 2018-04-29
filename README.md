# DevopsExam_MH
This project sets up an environment that contains 6 VMs running HAproxy, Apache2, Logstash, Elasticsearch and Kibana. 
The virtual machines are Linux-based (Ubuntu 12.04 OR CentOS7) and are supported by VirtualBox provider. 

NOTE: A mandatory requirement for this project is to have Vagrant installed. **Make sure to extract all files into the same vagrant folder for 'vagrant up' to work accordingly.** 

# Lab Description:
In this project: the Apache & HAproxy servers are installed directly on the VMs. 
Web tier (Apache servers) environment is configured to run with a minimum of 3 servers, for redundancy purposes. 

* HAproxy's stats page can be accessed by opening a web-browser and accessing this URL: http://192.168.50.2/haproxy?stats
* HAproxy server is listening on port 80 and balances the traffic to the web tier (using roundrobin algorythm). 

ELK stack includes: Logstash server, Elasticserver hosting Kibana as well. 
for this lab purposes, you need to generate data on the web tier to view logs via Kibana UI. follow this steps: 
1. run this command on one of the apache servers: 
for i in {1..10}; do curl http://192.168.50.101/var/www/index.html; sleep 3; done
2. log into Kibana WebUI at: http://192.168.50.4:5601
3. when running for the first time, you might encounter Kibana's management page to view logs. you must choose default-index-pattern, i chose * for this lab purposes, as well as assigned @timestamp for the default time parsing.
4. click on 'discover' and view the logs from 'apacheserver01' access logs. 

## Setting up the environment
**web-tier**
The cluster size can be controlled by setting a variable called WebFarm. 
NOTE: if you choose to scale up the cluster while the environment is up and runnig, make sure to re-provision the haproxy server for the new configuration to apply (vagrant provision <apacheservername>). 

In order to create the environment, open a shell terminal, navigate to the folder to which this project was cloned (e.g. in which the Vagrantfile is located) and type 'vagrant up'.Depending on the host, it may take ~10-20 minutes for the entire environment to be up and running.

The first 4 nodes will be set up accordingly:  
node1 (192.168.50.2) - haproxy server  
node2 (192.168.50.101) - apache server  
node3 (192.168.50.102) - apache server  
node4 (192.168.50.103) - apache server  

**ELK Stack**
This ELK stack consists of 2 servers:
1. logstash server forwarding logs to an elasticsearch node (listenning on port 5044 for filebeats input and forwariding on port 9200). 
2. elastic server hosting kibana accessible at: http://192.168.50.4:5601/

## Resetting the environment
In case an environment reset is needed, open a shell terminal and navigate to the Vagrantfile location and run vagrant destroy.
Once the command completes, perform the Build instructions again to build from scratch.
