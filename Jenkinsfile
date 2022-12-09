pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        
        stage('Checkout Configuration') {
            steps {
                sh 'pwd'
                sh 'ls -a'
                //git url: 'https://github.com/joshuaPerakis/jenkins-terraform.git', branch: 'configuration'
                sh 'git clone https://github.com/joshuaPerakis/jenkins-terraform.git --branch configuration .'
                sh 'pwd'
                sh 'ls -a'
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan --out tfplan.binary'
                sh 'terraform show -json tfplan.binary > tfplan.json'
            }
        }
        
        stage('Checkov Tests') {
            steps {
                sh 'checkov --config-file checkov_config.yaml'
            }
        }
        
        stage('Terraform Deploy') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        
    }
}
