pipeline {
    agent any
    environment {
        SONARQUBE_SERVER = 'sonarqube' // Ensure this matches the name in Jenkins' SonarQube configuration
        SONARQUBE_PROJECT_KEY = 'POC'  // Your SonarQube project key
        SONARQUBE_SCANNER_HOME = tool 'sonarqube' // The name given in Jenkins Global Tool Configuration
    }

    stages {
        stage('Admin') {
            steps {
                sh 'whoami'
            }
        }
        stage('Checkout') {
            steps {
                git url: 'https://github.com/vasantibendre06/poc.git', branch: 'main'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv(SONARQUBE_SERVER) {
                    sh """
                        ${SONARQUBE_SCANNER_HOME}/bin/sonar-scanner \
                        -Dsonar.projectKey=${SONARQUBE_PROJECT_KEY} \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://192.168.254.134:9000 \
                        -Dsonar.login=sqp_22b9370ede0f7a02eca0d928c131169b2aae539e \
                        
                    """
                }
            }
        }
        stage('Copying To apache2 dir') {
            steps {
                sh "cp -rf ./ /var/www/html"
                
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

