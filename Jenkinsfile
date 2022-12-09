pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        
        stage('Clean up') {
            steps {
                sh 'pwd'
                sh 'ls -a'
                sh 'rm -rf ./*'
                sh 'ls -a'
            }
        }
        
        stage('Checkout SCM') {
            steps {
                checkout scm;
            }
        }
        
        stage('Checkout Central Checkov Configuration File') {
            steps {
                sh 'pwd'
                sh 'ls -a'
                //git url: 'https://github.com/joshuaPerakis/jenkins-terraform.git', branch: 'configuration'
                sh 'git clone https://github.com/joshuaPerakis/jenkins-terraform.git --branch configuration'
                sh 'pwd'
                sh 'ls -a'
                sh 'ls -a jenkins-terraform'
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
                sh 'checkov --config-file jenkins-terraform/checkov_config.yaml --soft-fail-on CKV_AWS_7'
            }
        }
        
        stage('Terraform Deploy') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        
    }
}
