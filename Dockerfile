FROM alpine:latest
RUN apk update && apk add curl openjdk11-jre-headless && mkdir /opt/tomcat/ && \
    curl -LO https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.90/bin/apache-tomcat-8.5.90.tar.gz && \
    tar xvzf *.tar.gz --strip-components 1 --directory /opt/tomcat && \
    rm -rf /opt/tomcat/webapps/ROOT && rm -rf /*.tar.gz 
COPY ./target/*.war /opt/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]