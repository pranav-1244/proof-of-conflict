pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'sonarqube' // Replace with your SonarQube server name in Jenkins
        PROJECT_KEY = 'sonarqube' // Replace with your project key configured in SonarQube
        SONAR_SCANNER_HOME = tool name: 'SonarQube Scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
    }
    stages {
        stage('GitHub') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pranav-1244/proof-of-conflict.git']])
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube analysis
                    withSonarQubeEnv(SONARQUBE_SERVER) {
                        sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${PROJECT_KEY} -Dsonar.sources=."
                    }
                }
            }
        }
        stage('Build & Deploy'){
            steps{
                sh"""
                    sudo rm -rf /var/www/html/*
                    sudo cp -r * /var/www/html/
                    sudo systemctl restart apache2
                """    
            }
        }
    }
}
