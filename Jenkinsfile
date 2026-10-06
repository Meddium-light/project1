pipeline {
    agent any

    stages {

        stage('Install dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Use example CV') {
            steps {
                sh 'rm -f cv.json'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f dist/index.html'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'docker build -t project1:${BUILD_NUMBER} .'
            }
        }

        stage('start this image') {
            steps {
                sh 'docker run -d -p 5000:80 --name app1 project1:${BUILD_NUMBER}'
            }
        }

        stage('curl progon') {
            steps {
                sh 'sleep 10'
                sh 'curl -f http://127.0.0.1:5000/ > /dev/null'
            }
        }
    }
    post {
        always{
            sh 'docker rm -f app1 || true'
        }
    }
}