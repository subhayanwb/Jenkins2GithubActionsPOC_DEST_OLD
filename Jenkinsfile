pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-app:${env.BUILD_NUMBER}"
    }

    tools {
        // Specify the tool versions installed on Jenkins (make sure these are configured)
        maven 'Maven_3.8.1'
        jdk 'JDK_11'
    }

    stages {
        stage('Initialize') {
            steps {
                cleanWs() // Clean workspace before starting
                echo "Building with Maven and Docker"
            }
        }

        stage('Maven Build') {
            steps {
                // Run a Maven build using the configured Maven tool
                withMaven(maven: 'Maven_3.8.1') {
                    // Runs Maven goals like 'clean install'
                    echo "Running Maven build"
                    // Built-in Maven integration in Jenkins
                    mvn 'clean install'
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Create a Docker image using Docker pipeline plugin
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    docker.build("${DOCKER_IMAGE}", ".") // '.' refers to current directory where Dockerfile resides
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo "Pushing Docker image to registry"
                    docker.withRegistry('https://my-docker-registry.com', 'docker-credentials-id') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up workspace"
            cleanWs()
        }
        success {
            echo "Build and Docker image creation completed successfully!"
        }
        failure {
            echo "Build or Docker image creation failed."
        }
    }
}
