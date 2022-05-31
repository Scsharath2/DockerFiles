#Install tomcat on CentOs
#Pull the centos from the dockerhub
FROM centos:latest 
# Install the java
RUN yum install java -y
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
