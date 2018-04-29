#!/bin/bash

# Install apache
  /usr/bin/apt-get -y install apache2
  cat > /var/www/index.html <<EOD
<html><head><title>${HOSTNAME}</title></head><body><h1>${HOSTNAME}</h1>
<p>This is the default web page for ${HOSTNAME}.</p> <p>Geni, Vidi, Vici.</p>
</body></html>
EOD

# Log the X-Forwarded-For
  perl -pi -e  's/^LogFormat "\%h (.* combined)$/LogFormat "%h %{X-Forwarded-For}i $1/' /etc/apache2/apache2.conf
  /usr/sbin/service apache2 restart


# Install & Configure FileBeat 
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
  sudo  /usr/bin/apt-get install apt-transport-https
  echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
  sudo  /usr/bin/apt-get update 
  sudo  /usr/bin/apt-get install filebeat
  sudo update-rc.d filebeat defaults 95 10

  sudo mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.backup
  sudo cp -f /vagrant/filebeat.yml /etc/filebeat
  sudo service filebeat start
  
