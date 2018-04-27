#!/bin/bash
# Install Java "1.8.0_161"
	sudo yum install -y java 

	
# Install elasticsearch    
	sudo cp -f /vagrant/elasticsearch.repo /etc/yum.repos.d
	sudo yum install -y elasticsearch
	sudo systemctl daemon-reload
	sudo systemctl enable elasticsearch.service
	sudo systemctl start elasticsearch.service
	
# Install Kibana

