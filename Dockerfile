# Use an official Ubuntu image as the base
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the.war file from the target directory
COPY target/thegame.war /var/lib/tomcat9/webapps/

# Install Tomcat 9
RUN apt-get update && apt-get install -y tomcat9

# becomes
RUN apt-get update && apt-get install -y tomcat9-common tomcat9-user

# however, the tomcat9 package is not available in the default repository
# enable universe repository
RUN sed -i 's/# \(.*universe\)/\1/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tomcat9

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
