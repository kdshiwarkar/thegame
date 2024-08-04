pipeline {
	agent any
	
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh ' /home/kunalshiwarkar/Documents/Devops_software/tar/apache-maven-3.9.7/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/thegame.war /home/kunalshiwarkar/Documents/Devops_software/tar/apache-tomcat-9.0.89/webapps'
			}}
			stage('podman build'){
		    steps {
			sh 'podman build -f Dockerfile -t kunalsh/image45 .'
			}}
			stage('Container creation'){
		    steps {
			sh 'podman  run -it -d --name=container_pipe kunalsh/image45 /bin/bash'
			}}	
}}
