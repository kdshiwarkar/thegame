# Use the official Ubuntu image as the base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jdk \
    maven \
    curl \
    docker.io \
    && apt-get clean

# Install Maven with retry logic
RUN mkdir -p /usr/local/maven && \
    curl --retry 5 --retry-delay 10 -o /tmp/apache-maven-3.9.7-bin.tar.gz \
    https://downloads.apache.org/maven/maven-3/3.9.7/binaries/apache-maven-3.9.7-bin.tar.gz && \
    tar -xzf /tmp/apache-maven-3.9.7-bin.tar.gz -C /usr/local/maven --strip-components=1 && \
    ln -s /usr/local/maven/bin/mvn /usr/bin/mvn

# Install Tomcat
RUN mkdir -p /usr/local/tomcat && \
    curl --retry 5 --retry-delay 10 -o /tmp/apache-tomcat-9.0.89.tar.gz \
    https://downloads.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz && \
    tar -xzf /tmp/apache-tomcat-9.0.89.tar.gz -C /usr/local/tomcat --strip-components=1

# Set environment variables for Tomcat
ENV CATALINA_HOME=/usr/local/tomcat

# Copy your application source code into the image
COPY . /app

# Set working directory
WORKDIR /app

# Run Maven build
RUN mvn install

# Copy the WAR file to Tomcat's webapps directory
RUN cp target/thegame.war $CATALINA_HOME/webapps

# Expose Tomcat's port
EXPOSE 8080

# Run Tomcat when the container starts
CMD ["catalina.sh", "run"]



