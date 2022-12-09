pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        
//         stage('Git Checkout') {
//             steps {
//                 git url: 'https://github.com/joshuaPerakis/jenkins-terraform.git', branch: 'main'
// //                 sh 'pip3 uninstall virtualenv -y'
// //                 sh 'pip3 list'
// //                 sh 'pip3 install virtualenv'
// //                 sh 'pip3 list'
// //                 sh '/var/lib/jenkins/.local/bin/virtualenv --version'
//             }
//         }
        
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
