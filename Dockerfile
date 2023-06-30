FROM ubuntu:latest

# Update packages and install OpenJDK and other dependencies
RUN apt-get update && apt-get install -y openjdk-11-jdk curl

# Set environment variables for Tomcat version and installation directory
ENV TOMCAT_MAJOR_VERSION 
ENV TOMCAT_MINOR_VERSION 8.5.69
ENV CATALINA_HOME /opt/tomcat

# Download and extract Apache Tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    tar -xf apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz -C /opt && \
    mv /opt/apache-tomcat-${TOMCAT_MINOR_VERSION} ${CATALINA_HOME}

# Copy your WAR file to the Tomcat webapps directory
COPY target/*.war ${CATALINA_HOME}/webapps/

# Expose port 8080 for HTTP traffic
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
