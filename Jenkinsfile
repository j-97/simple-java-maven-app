pipeline {
    agent any
   tools{
       maven "Maven1"
   }
    stages {
        stage('Build') { 
            
            steps {
                sh 'mvn -B -DskipTests clean package' 
                sh 'echo "hello there"'
                sh '''
                    pwd
                    cd ..
                    pwd
                    '''
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

