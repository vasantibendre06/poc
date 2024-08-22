pipeline {
    agent any
    environment {
        APACHE_ROOT = '/var/www/html'
    }

    stages {
        stage('Admin'){
            steps{
                sh 'sudo -i'
            }
        }
        stage('Checkout') {
            steps {
                git url: 'https://github.com/vasantibendre06/poc.git', branch: 'main'
            }
        }
        stage('Deploy'){
            steps{
                sh "cp -r ./ ${APACHE_ROOT}"
                sh 'systemctl restart apache2'
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
