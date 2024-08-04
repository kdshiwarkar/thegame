#use the image
FROM ubuntu:latest
MAINTAINER kdshiwarkar@gmail.com

# create directory 
WORKDIR /opt/download/

# update package list
RUN apt-get update

# upgrade package list
RUN apt-get -y upgrade

# install package
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get update
RUN apt-get install -y wget

# download tomcat,maven,java
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
RUN wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz

# extract tar file 
RUN tar -xvf apache-tomcat-9.0.91.tar.gz
RUN tar -xvf apache-maven-3.9.8-bin.tar.gz
RUN tar -xvf jdk-22_linux-x64_bin.tar.gz



# copy file into /opt/download/
COPY apache-tomcat-9.0.91 /opt/download/
COPY apache-maven-3.9.8 /opt/download/
COPY jdk-22.0.2 /opt/download/

# Run Maven install
RUN  /opt/download/apache-maven-3.9.8/bin/mvn install

# ADD war file 
ADD /home/kunalshiwarkar/.jenkins/workspace/thegame/target/thegame.war /opt/download/apache-tomcat-9.0.91/webapps/

#Set environment variables
ENV JAVA_HOME /opt/download/jdk-22.0.2
ENV M2_HOME /opt/download/apache-maven-3.9.8
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

# Start Tomcat on container startup
CMD ["/opt/download/apache-tomcat-9.0.91/bin/startup.sh"]










