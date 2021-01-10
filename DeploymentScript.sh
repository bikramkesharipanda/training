#!/bin/sh 
#update system packages 
apt-get update 
#Install default jdk 
apt-get install -y default-jdk 
#create a new tomcat group 
groupadd tomcat 
#create a new tomcat user 
useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat 
#Download tomcat 
cd /tmp 
curl -O https://mirror.olnevhost.net/pub/apache/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz 
mkdir /opt/tomcat 
tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 
#Update Permissions 
cd /opt/tomcat 
chgrp -R tomcat /opt/tomcat 
chmod -R g+r conf 
chmod g+x conf 
chown -R tomcat webapps/ work/ temp/ logs/ 
#Run tomcat 
cd bin 
sh startup.sh 
#Copy sample war to tomcat webapps directory 
#cp /home/ubuntu/training/sample.war /opt/tomcat/webapps/sample.war