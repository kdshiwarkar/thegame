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
                sh 'cp target/thegame.war /home/kunalshiwarkar/.jenkins/workspace/thegame/thegame.war'
            }
         }
        stage('docker build') {
            steps {
                sh 'docker build -t kunalsh/image10 .'
            }
        }
        stage('Container creation') {
            steps {
                sh 'docker run -it -d --name=kunalcont11 -p 1102:8080 kunalsh/image10 /bin/bash'
            }
        }
         stage('Copy war file to container') {
            steps {
              sh 'docker cp /home/kunalshiwarkar/.jenkins/workspace/thegame/thegame.war kunalcont11:/opt/download/apache-tomcat-9.0.91/webapps'
         }
        }
    }
}
