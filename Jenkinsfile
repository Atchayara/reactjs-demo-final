pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Atchayara/reactjs-demo-final.git'
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
                withCredentials([file(credentialsId: 'PemKeyy', variable: 'EC2_PEM_KEY')]) {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
    }
}
