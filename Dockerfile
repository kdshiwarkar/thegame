FROM centos:latest

# Install Maven
RUN yum install -y maven

# Install Tomcat
RUN yum install -y tomcat

# Copy the war file to the Tomcat webapps directory
COPY target/thegame.war /usr/share/tomcat/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
