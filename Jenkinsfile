pipeline {

  agent any

  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
      }
    }

    stage('TF File Param') {
      steps {
 	writeFile file: "setup.tfvars", text: params.TFVARS
        sh 'cat setup.tfvars'
      }
    }

  } 

}
