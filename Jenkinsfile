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
                sh 'mvn install'
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
    }
}
