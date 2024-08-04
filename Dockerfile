# # Use an official Ubuntu image as the base
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the.war file from the target directory
COPY target/thegame.war /app/

# Install Tomcat 8.5
RUN apt-get update && apt-get install -y tomcat8.5

# Configure Tomcat to use the.war file
RUN cp /app/thegame.war /var/lib/tomcat8.5/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]
