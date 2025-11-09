pipeline {
    agent any
    
    environment {
        PYTHON_VERSION = '3.12'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Setup Environment') {
            steps {
                script {
                    bat 'pip install -r requirements.txt'
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    bat 'robot -d TestLogs Tests'
                }
            }
        }
    }
    
    post {
        always {
            robot outputPath: 'TestLogs', 
                logFileName: 'log.html',
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                passThreshold: 100.0,
                unstableThreshold: 75.0
            cleanWs()
        }
    }
}