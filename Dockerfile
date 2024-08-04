# Use an Ubuntu-based Tomcat image as the base
FROM tomcat:9.0.89-jdk11-openjdk

# Copy the WAR file to the webapps directory
COPY target/thegame.war /usr/local/tomcat/webapps/

# Expose the Tomcat port
EXPOSE 8080

# Set the default command to start Tomcat
CMD ["catalina.sh", "run"]

