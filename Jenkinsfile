pipeline {
    agent any

    stages {
        stage('Login into DockerHub') {
            steps {
                 withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                 sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                }
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x Build.sh'
                sh './Build.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
