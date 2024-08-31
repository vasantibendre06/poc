pipeline {
    agent any
    environment {
        SONARQUBE_URL = 'http://13.60.75.174:9000'
        SONARQUBE_CREDENTIALS = 'SonarqubeTest'
    }

    stages {
        stage('Admin'){
            steps{
                sh 'whoami'
                sh 'sudo -i'
            }
        }
        stage('SonarQube Scan') {
            steps {
                script {
                    def scannerHome = tool 'SonarQube Scanner'
                    withSonarQubeEnv('SonarQube Server') {
                        sh "${scannerHome}/bin/sonar-scanner -Dproject.settings=sonar.properties"
                    }
                }
            }
        }
        stage('Checkout') {
            steps {
                git url: 'https://github.com/vasantibendre06/poc.git', branch: 'main'
            }
        }
        stage('Deploy'){
            steps{
                sh "sudo cp -r ./ /var/www/html"
                sh 'sudo systemctl restart apache2'
            }
        }
    }
    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
