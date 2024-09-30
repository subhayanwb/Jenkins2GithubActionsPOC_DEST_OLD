pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Simulate a build process
                echo 'Building the project...'
            }
        }

        stage('Test') {
            steps {
                // Simulate a test process
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                // Simulate a deploy process
                echo 'Deploying the project...'
            }
        }
    }

    post {
        always {
            // Clean up workspace
            echo 'Cleaning workspace...'
            cleanWs()
        }
    }
}
