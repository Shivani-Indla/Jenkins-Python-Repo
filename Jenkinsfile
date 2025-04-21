
pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: true, description: 'Automatically run apply after generating plan?')
    }
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('checkout') {
            steps {
                script {
                    dir("terraform")
                    {
                        git "https://github.com/Shivani-Indla/Jenkins-Python-Repo.git"
                    }
                }
            }
        }
        stage('Plan') {
            steps {
                sh 'pwd; cd terraform/; terraform init'
                sh 'pwd; cd terraform/; terraform plan -out tfplan'
                sh 'pwd; cd terraform/; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?"
                    parameters: [text(name: 'plan', defaultValue: plan, description: 'Please review the Plan')]
                }
            }
        }
        stage('Apply') {
            steps {
                sh "pwd; cd terraform/; terraform apply -input=false tfplan"
            }
        }
    }
}
