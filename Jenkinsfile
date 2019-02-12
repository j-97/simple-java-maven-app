pipeline {
    agent { label 'master' }
    tools{
        maven 'maven 3'
        jdk 'java 8'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}