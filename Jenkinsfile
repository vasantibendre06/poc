pipeline {
    agent any
    tools { nodejs "NodeJS" } 

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/vasantibendre06/poc.git', branch: 'main'
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