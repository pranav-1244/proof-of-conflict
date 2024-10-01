pipeline {
    agent any

    environment {
        // Dynamically set SonarQube server details
        SONARQUBE_URL = "http://${env.EC2_PUBLIC_IP}:9000"
        GITHUB_REPO = 'https://github.com/pranav-1244/proof-of-conflict.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the code from GitHub
                git branch: 'main', url: "${GITHUB_REPO}"
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Run SonarQube analysis on the HTML file
                withSonarQubeEnv('SonarQube') {
                    sh "sonar-scanner -Dsonar.projectKey=my_project -Dsonar.sources=. -Dsonar.host.url=${SONARQUBE_URL} -Dsonar.login=${SONARQUBE_TOKEN}"
                }
            }
        }

        stage('Quality Gate') {
            steps {
                // Wait for the SonarQube quality gate result
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Deploy to Apache2') {
            when {
                expression { return currentBuild.result == 'SUCCESS' }
            }
            steps {
                // Copy the HTML file to Apache2 directory
                sh '''
                sudo cp index.html /var/www/html/index.html
                '''
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed!"
        }
    }
}
