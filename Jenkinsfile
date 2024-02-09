pipeline {
    agent any

    stages {
        stage('Login into DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                }
            }
        }

        stage('Changing the File Permission') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
            }
        }

        stage('Executing the File') {
            steps {
                sh './build.sh'
                sh './deploy.sh'
            }
        }
    }
}
