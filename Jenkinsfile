pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    
    triggers {
        pollSCM 'H * * * *'
    }
    
    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }

post {
        always {
            step([$class: 'Mailer', notifyEveryUnstableBuild: true,
                recipients: ''])
        }
    }
}