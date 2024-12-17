pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('dockerhub-credentials').username
        DOCKER_PASSWORD = credentials('dockerhub-credentials').password
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/chadiabalti/monapi.git'  // Remplace par ton repo
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerRegistry = "docker.io"
                    def dockerRepo = "baltichadia/monapi"
                    def dockerImage = "${dockerRegistry}/${dockerRepo}:latest"

                    // Construire l'image Docker
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

                    // Se connecter à DockerHub
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"

                    // Pousser l'image vers DockerHub
                    sh "docker push ${dockerImage}"
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    def dockerImage = "baltichadia/monapi:latest"
                    // Lancer le conteneur avec l'image Docker
                    sh "docker run -d -p 5000:5000 ${dockerImage}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}



