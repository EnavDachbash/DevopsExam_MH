#!/bin/bash

# Install Java "1.8.0_161"
	sudo yum install -y java 

	
# Install logstash    
	sudo cp -f /vagrant/logstash.repo /etc/yum.repos.d
	sudo yum install -y logstash
	sudo cp -f /vagrant/logstashbeats-input.conf /etc/logstash/conf.d
	sudo mkdir /etc/logstash/patterns
	sudo cp -f /vagrant/iptables.patterns /etc/logstash/patterns
	sudo /usr/share/logstash/bin/system-install
	sudo systemctl start logstash.service
	