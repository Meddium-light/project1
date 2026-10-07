pipeline {
    agent any

    stages {

        stage('Install dependencies') {
            steps {
                sh 'npm ci'
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

        stage('Push image to GHCR') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'ghcr-creds',
                        usernameVariable: 'GHCR_USER',
                        passwordVariable: 'GHCR_TOKEN'
                        )
                    ]) {
                    sh '''
                       echo "$GHCR_TOKEN" | docker login ghcr.io \
                           -u "$GHCR_USER" \
                           --password-stdin

                        docker tag project1:${BUILD_NUMBER} ghcr.io/meddium-light/project1:${BUILD_NUMBER}
                       docker tag project1:${BUILD_NUMBER} ghcr.io/meddium-light/project1:latest

                        docker push ghcr.io/meddium-light/project1:${BUILD_NUMBER}
                     docker push ghcr.io/meddium-light/project1:latest
                    '''
                    }
            }
        }
    }
    post {
        always{
            sh 'docker rm -f app1 || true'
            sh 'docker logout ghcr.io || true'
        }
    }
}