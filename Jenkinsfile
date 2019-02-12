pipeline {
    agent { label 'master' }
    tools{
        maven 'M1'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}