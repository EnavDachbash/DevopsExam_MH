#!/bin/bash

sudo apt-get update
sudo apt-get install -y haproxy
sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.backup
sudo cp -f /vagrant/haproxy.cfg /etc/haproxy
for i in $(seq 1 $WEB_CLUSTER_SIZE); do echo "		server 	apacheserver0$i 192.168.50.10$i:80 check" >>/etc/haproxy/haproxy.cfg; done
sudo service haproxy restart

# Install & Configure FileBeat 
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
  sudo  /usr/bin/apt-get install apt-transport-https
  echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
  sudo  /usr/bin/apt-get update
  sudo  /usr/bin/apt-get install filebeat
  sudo update-rc.d filebeat defaults 95 10
  
  sudo mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.backup
  sudo cp -f /vagrant/filebeat.yml /etc/filebeat
