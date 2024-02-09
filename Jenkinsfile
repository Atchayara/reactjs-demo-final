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
                withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
           stage('Deploy to AWS EC2') {
            steps {
                script {
                    // Copy the Docker image to EC2 instance
                    sh "scp -o StrictHostKeyChecking=no -i ${EC2_PEM_KEY} target/docker/your-web-app.tar ec2-user@${EC2_INSTANCE_IP}:/path/on/ec2/"

                    // SSH into EC2 instance and run the Docker container
                   sh "ssh -o StrictHostKeyChecking=no -i ${EC2_PEM_KEY} ec2-user@${EC2_INSTANCE_IP} 'docker run -d -p 80:80 your-web-app'"
                }

}
}
}
}
