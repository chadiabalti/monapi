pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')  // Nom des identifiants DockerHub
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/chadiabalti/td-atelier-de-genie-logiciel.git' // Remplace par ton propre repo GitHub
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t baltichadia/monapi:latest .'  // Remplace par ton nom DockerHub
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Se connecter à DockerHub
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    // Pousser l'image vers DockerHub
                    sh 'docker push baltichadia/monapi:latest'  // Remplace par ton nom DockerHub
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // Lancer le conteneur avec l'image Docker
                    sh 'docker run -d -p 5000:5000 baltichadia/monapi:latest'  // Remplace par ton nom DockerHub
                }
            }
        }
    }
}

