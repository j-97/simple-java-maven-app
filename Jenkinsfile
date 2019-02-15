pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
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
                sh '''
                    docker build -t mavenapp .
                    docker tag mavenapp jagriti97/mavenapp
                    docker login https://docker.optum.com -u jagriti97 -p Jbnk@1997
                    docker push jagriti97/mavenapp
                    docker image prune -f
                '''
            }
        }
    }
}

