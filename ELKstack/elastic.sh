#!/bin/bash
# Install Java "1.8.0_161"
	sudo yum install -y java 

	
# Install elasticsearch    
	sudo cp -f /vagrant/elasticsearch.yml /etc/elasticsearch/
    sudo mkdir -p /var/data/elasticsearch
    sudo chown -R elasticsearch:elasticsearch /var/data/elasticsearch
	sudo cp -f /vagrant/elasticsearch.repo /etc/yum.repos.d
	sudo yum install -y elasticsearch
	sudo systemctl daemon-reload
	sudo systemctl enable elasticsearch.service
	sudo systemctl start elasticsearch.service
	
# Install Kibana
    sudo cp -f /vagrant/kibana.repo /etc/yum.repos.d
	sudo yum update
	sudo yum install -y kibana
	sudo chkconfig --add kibana
	sudo cp -f /vagrant/kibana.yml /etc/kibana/
	sudo systemctl enable kibana.service
	sudo systemctl start kibana.service
