# DevopsExam_MH
This project sets up an environment that contains 4 VMs running HAproxy and Apache2. 
The virtual machines are Linux-based (Ubuntu 12.04) and are supported by VirtualBox provider. 

NOTE: A mandatory requirement for this project is to have Vagrant installed.

In this project: the Apache & HAproxy servers are installed directly on the VMs. 
Web tier (Apache servers) environment is configured to run with a minimum of 3 servers, for redundancy purposes. 

* HAproxy's stats page can be accessed by opening a web-browser and accessing this URL: http://192.168.50.2/haproxy?stats
* HAproxy server is listening on port 80 and balances the traffic to the web tier (using roundrobin algorythm). 


## Setting up the environment
The cluster size can be controlled by setting a variable called WebFarm. 
NOTE: if you choose to scale up the cluster while the environment is up and runnig, make sure to re-provision the haproxy server for the new configuration to apply (vagrant provision <apacheservername>). 

In order to create the environment, open a shell terminal, navigate to the folder to which this project was cloned (e.g. in which the Vagrantfile is located) and type 'vagrant up'.Depending on the host, it may take ~10-20 minutes for the entire environment to be up and running.

The first 4 nodes will be set up accordingly:
node1 (192.168.50.2) - haproxy server
node2 (192.168.50.101) - apache server 
node3 (192.168.50.102) - apache server
node4 (192.168.50.103) - apache server

## Resetting the environment
In case an environment reset is needed, open a shell terminal and navigate to the Vagrantfile location and run vagrant destroy.
Once the command completes, perform the Build instructions again to build from scratch.
