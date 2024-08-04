# Use an official Ubuntu image as the base
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the.war file from the target directory
COPY target/thegame.war /usr/local/tomcat/webapps/

# Install Tomcat 9
RUN apt-get update && apt-get install -y tomcat9

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
