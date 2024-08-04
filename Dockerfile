# Use the official CentOS image as the base
FROM centos:latest

# Set the working directory to /app
WORKDIR /app

# Copy the Maven executable to the container
COPY apache-maven-3.9.7 /app/apache-maven-3.9.7

# Set the MAVEN_HOME environment variable
ENV MAVEN_HOME /app/apache-maven-3.9.7

# Add the Maven executable to the PATH
ENV PATH $MAVEN_HOME/bin:$PATH

# Copy the Tomcat executable to the container
COPY apache-tomcat-9.0.89 /app/apache-tomcat-9.0.89

# Copy the thegame.war file to the Tomcat webapps directory
COPY target/thegame.war /app/apache-tomcat-9.0.89/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Set the default command to run when the container starts
CMD ["mvn", "install"]
