# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|  
	config.vm.provider "virtualbox" do |v|
		v.memory = 512
		v.cpus = 2
	end  
	#Enter the web tier cluster size here for better scalability: 
	#NOTE: if you choose to scale up while the environment is up and runnig - 
	#make sure to re-provision the haproxy server for the new configuration to apply. (vagrant provision <apacheservername>)
	WebFarm = 3
	
	config.vm.define :haproxy do |haproxyserver|
		haproxyserver.vm.box = "ubuntu/precise64"
		haproxyserver.vm.network :private_network, ip: "192.168.50.2"
		haproxyserver.vm.provision "shell", path: "haproxy.sh", env: {"WEB_CLUSTER_SIZE" => WebFarm}, run: "always"
		haproxyserver.vm.hostname = "HAproxyServer"
	end
	
	(1..WebFarm).each do |i|
		config.vm.define "apacheserver0#{i}" do |node|
			node.vm.box = "ubuntu/precise64"
			node.vm.hostname = "apacheserver0#{i}"
			node.vm.network "private_network", ip: "192.168.50.10#{i}"
			node.vm.provision "shell", path: "apache.sh", run: "always", args: "apacheserver0#{i} 192.168.50.10#{i}"
		end
	end 
	
	config.vm.define :elasticsearch do |elasticsearchserver|
		elasticsearchserver.vm.box = "centos/7"
		elasticsearchserver.vm.box_version = "1803.01"
		elasticsearchserver.vm.network :private_network, ip: "192.168.50.4"
		elasticsearchserver.vm.provision "shell", path: "elastic.sh", run: "always"
		elasticsearchserver.vm.hostname = "elasticsearchserver"
	end
	
	config.vm.define :logstash do |logstashserver|
		logstashserver.vm.box = "centos/7"
		logstashserver.vm.box_version = "1803.01"
		logstashserver.vm.network :private_network, ip: "192.168.50.3"
		logstashserver.vm.provision "shell", path: "logstash.sh", run: "always"
		logstashserver.vm.hostname = "logstashserver"
	end
end
