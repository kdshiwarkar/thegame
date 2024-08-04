FROM centos:latest

# Update DNS resolver configuration
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Install Maven
RUN yum install -y --disablerepo=* --enablerepo=base maven

# Install Tomcat
RUN yum install -y tomcat

# Copy the war file to the Tomcat webapps directory
COPY target/thegame.war /usr/share/tomcat/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
