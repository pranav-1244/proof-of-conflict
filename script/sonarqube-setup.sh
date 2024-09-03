#!/bin/bash
echo "Updating and installing SonarQube..."
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
unzip sonarqube-9.3.0.51899.zip
sudo mv sonarqube-9.3.0.51899 /opt/sonarqube
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube
sudo sh -c 'echo "sonar.server.port=9000" >> /opt/sonarqube/conf/sonar.properties'
sudo su - sonar -c '/opt/sonarqube/bin/linux-x86-64/sonar.sh start'

