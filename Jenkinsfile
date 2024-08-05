pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh '/home/kunalshiwarkar/Documents/Devops_software/tar/apache-maven-3.9.7/bin/mvn install'
            }
        }
        stage('Deployment') {
            steps {
                sh 'cp target/thegame.war /home/kunalshiwarkar/Documents/Devops_software/tar/apache-tomcat-9.0.89/webapps'
            }
        }
        stage('docker build') {
            steps {
                sh 'docker build -t kunalsh/image45 .'
            }
        }
        stage('Container creation') {
            steps {
                sh 'docker run -it -d --name=container_pipe kunalsh/image45 /bin/bash'
            }
        }
         stage('Build Project') {
            steps {
                sh '/$M2_HOME/bin/mvn install'
            }
        }
        stage('Deployment project') {
            steps {
                sh 'cp /home/kunalshiwarkar/.jenkins/workspace/thegame/target/thegame.war /opt/download/apache-tomcat-9.0.91/webapps'
            }
        }
    }
}
