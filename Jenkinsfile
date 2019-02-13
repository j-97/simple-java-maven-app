pipeline {
    agent { label 'MyDocker' }
    stages {
        stage('Build') { 
            steps {
                @docker.image('maven:3.3.3-jdk-8').inside {
                    sh 'mvn -B clean install'
                }
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}

