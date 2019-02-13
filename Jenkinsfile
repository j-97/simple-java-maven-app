pipeline {
    agent { label 'MyDocker' }
   
    stages {
        stage('Build') { 
            agent{
                label 'MyDocker'
                image 'maven:3-alpine'
            }
            steps {
                sh 'mvn -B -DskipTests clean package' 
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

