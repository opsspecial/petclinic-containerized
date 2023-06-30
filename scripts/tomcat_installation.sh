#!/bin/bash

# Update system packages
apt update
apt upgrade -y

# Install Java Development Kit (JDK)
apt install -y wget tar default-jdk

# Download Apache Tomcat 8.5
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz

# Extract the downloaded archive
tar -xf apache-tomcat-8.5.69.tar.gz

# Move the extracted directory to /opt
mv apache-tomcat-8.5.69 /opt/tomcat8

