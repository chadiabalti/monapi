pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')  // Remplace par le nom exact des identifiants DockerHub dans Jenkins
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()  // Nettoyer l'espace de travail avant chaque build
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/chadiabalti/monapi.git'  // Remplace par ton repo GitHub
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerRegistry = "docker.io"
                    def dockerRepo = "baltichadia/monapi"
                    def dockerImage = "${dockerRegistry}/${dockerRepo}:latest"

                    echo "Building Docker image: ${dockerImage}"
                    sh "docker build -t ${dockerImage} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def dockerRegistry = "docker.io"
                    def dockerRepo = "baltichadia/monapi"
                    def dockerImage = "${dockerRegistry}/${dockerRepo}:latest"

                    echo "Logging in to DockerHub..."
                    sh "echo ${DOCKER_CREDENTIALS_PSW} | docker login -u ${DOCKER_CREDENTIALS_USR} --password-stdin"

                    echo "Pushing Docker image: ${dockerImage}"
                    sh "docker push ${dockerImage}"
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    def dockerImage = "baltichadia/monapi:latest"

                    echo "Deploying Docker container from image: ${dockerImage}"
                    sh "docker run -d --name monapi-container -p 5000:5000 ${dockerImage}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}




