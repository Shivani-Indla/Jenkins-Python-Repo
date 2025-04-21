
pipeline {
    agent {
    label 'Agent-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    environment{
        DEPLOYE_TO = 'production'
        GREETINGS = 'Good Morning'
    }
    stages {
        stage('Init') {
            steps {
                sh """
                ls -ltr
                """
            }
        }
        stage('Test') {
            steps {
                sh 'echo Hi this is shiva Deploy in Agent-1'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo Hi this is shiva Deploy in Agent-1'
            }
            post{
                always{
                    echo 'I will always say hello again'
                }
                success{
                    echo 'I will run when pipeline is success'
                }
                failure{
                    echo 'I will run when pipeline is failure'
                }
            }
        }
    }
}
