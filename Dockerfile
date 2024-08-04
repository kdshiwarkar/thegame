# Use the official Maven image as the base
FROM maven:3.9.7-jdk-11

# Set the working directory to /app
WORKDIR /app

# Copy the Tomcat executable to the container
COPY apache-tomcat-9.0.89 /app/apache-tomcat-9.0.89

# Copy the thegame.war file to the Tomcat webapps directory
COPY target/thegame.war /app/apache-tomcat-9.0.89/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Set the default command to run when the container starts
CMD ["apache-tomcat-9.0.89/bin/catalina.sh", "run"]
