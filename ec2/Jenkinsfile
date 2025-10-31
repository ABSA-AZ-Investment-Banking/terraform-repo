pipeline {
    agent any

    stages {
        stage('init') {
            steps {
                sh 'echo Hi this is stage init'
            }
        }
        stage('plan') {
            steps{
                echo "Hi this is stage plan"
            }
        }
        stage('apply') {
            steps {
                echo "Hi this is stage apply"
            }
        }
    }
}