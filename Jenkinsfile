pipeline {

  agent any

  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
    GOOGLE_APPLICATION_CREDENTIALS = "${env.WORKSPACE}" + "/serviceaccount.json"
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'echo GOOGLE_APPLICATION_CREDENTIAL=$GOOGLE_APPLICATION_CREDENTIALS'
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS'
      }
    }

    stage('TF File Param') {
      steps {
 	writeFile file: "setup.tfvars", text: params.TFVARS
        sh 'cat setup.tfvars'
      }
    }

    stage('TF Plan') {
      steps {
        sh 'terraform init'
        sh 'terraform plan -out myplan'
      }
    }

    stage('TF Apply') {
      steps {
        sh 'terraform apply -input=false myplan'
      }
    }

  } 
}
