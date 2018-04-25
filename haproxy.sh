#!/bin/bash

sudo apt-get update
sudo apt-get install -y haproxy
sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.backup
sudo cp -f /vagrant/haproxy.cfg /etc/haproxy
for i in $(seq 1 $WEB_CLUSTER_SIZE); do echo "		server 	apacheserver0$i 192.168.50.10$i:80 check" >>/etc/haproxy/haproxy.cfg; done
sudo service haproxy restart
