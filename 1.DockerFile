#Install tomcat on CentOs
#Pull the centos from the dockerhub, Please rename file to "Dockerfile" when Using it.
FROM ubuntu:latest
MAINTAINER  Sharath <scsharath2@gmail.com>

# Install the java
# Install basic software support
RUN apt-get update && \
    apt-get install --yes software-properties-common

# Add the JDK 8 and accept licenses (mandatory)
RUN add-apt-repository ppa:ts.sch.gr/ppa && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install Java 8
RUN apt-get update && \
    apt-get --yes --no-install-recommends install oracle-java8-installer

#Create a new directory
RUN mkdir /opt/tomcat
#Change directory, all commands are executed inside this directory
WORKDIR /opt/tomcat
#Download the tomcat packages, . meaning install in the current directory
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79.tar.gz .
#File is downloaded as tar, need to extract
RUN tar -xvzf apache-tomcat-8.5.79.tar.gz
#Rename the extracted file, below just moves the content to tomcat directory
RUN mv apache-tomcat-8.5.79/* /opt/tomcat
#Tell to docker that it runs on port 8080
EXPOSE 8080
#In tomcat, catalina.sh file is used to start tomcat service
CMD ["/opt/tomcat/bin/catalina.sh","run"]
