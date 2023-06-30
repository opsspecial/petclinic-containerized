FROM ubuntu:latest

# Update packages and install OpenJDK and other dependencies
RUN apt-get update && apt-get install -y openjdk-11-jdk curl

# Set environment variables for Tomcat version and installation directory

ENV CATALINA_HOME /opt/tomcat

# Download and extract Apache Tomcat
RUN mkdir -p ${CATALINA_HOME} && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz -o /tmp/apache-tomcat.tar.gz && \
    tar -xf /tmp/apache-tomcat.tar.gz  -C /tmp/ && \
    mv /tmp/apache-tomcat-8.5.69/* ${CATALINA_HOME} && \
    rm -rf /tmp/apache-tomcat.tar.gz /tmp/apache-tomcat-8.5.69

# Copy your WAR file to the Tomcat webapps directory
COPY target/*.war ${CATALINA_HOME}/webapps/

# Expose port 8080 for HTTP traffic
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
