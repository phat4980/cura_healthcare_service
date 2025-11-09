pipeline {
    agent any

    stages {
        stage('Run Tests') {
            steps {
                sh script: "robot --nostatusrc -d TestLogs Tests", returnStatus: true
            }
        }
    }
    post {
        always {
            robot(
                outputPath: "TestLogs",
                passThreshold: 90.0,
                unstableThreshold: 70.0,
                disableArchiveOutput: true,
                outputFileName: "output.xml",
                logFileName: 'log.html',
                reportFileName: 'report.html',
                countSkippedTests: true
            )
        }
    }
}