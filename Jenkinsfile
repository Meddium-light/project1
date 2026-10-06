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
    }
}