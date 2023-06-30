FROM ubuntu:latest

# Update packages and install OpenJDK and other dependencies
RUN apt-get update && apt-get install -y openjdk-11-jdk curl

# Set environment variables for Tomcat version and installation directory

ENV CATALINA_HOME /opt/tomcat

# Download and extract Apache Tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz && \
    tar -xf apache-tomcat-8.5.69.tar.gz -C /opt && \
    mv /opt/apache-tomcat-8.5.69.tar.gz ${CATALINA_HOME}

# Copy your WAR file to the Tomcat webapps directory
COPY target/*.war ${CATALINA_HOME}/webapps/

# Expose port 8080 for HTTP traffic
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
