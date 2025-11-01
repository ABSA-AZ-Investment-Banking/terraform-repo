pipeline {
  agent any

  parameters {
    choice(
      name: 'STAGE_TO_RUN',
      choices: ['ALL', 'INIT', 'VALIDATE', 'PLAN', 'APPLY', 'DESTROY'],
      description: 'Select which Terraform stage to run'
    )
  }

  environment {
    TF_DIR = './ec2'  // Folder where your Terraform files exist
    AWS_REGION = 'us-east-1'
  }

  stages {

    stage('Init') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'INIT' }
        }
      }
      steps {
        dir("${env.TF_DIR}") {
          sh 'terraform init -input=false'
        }
      }
    }

    stage('Validate') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'VALIDATE' }
        }
      }
      steps {
        dir("${env.TF_DIR}") {
          sh 'terraform validate'
        }
      }
    }

    stage('Plan') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'PLAN' }
        }
      }
      steps {
        dir("${env.TF_DIR}") {
          sh 'terraform plan -out=tfplan'
        }
      }
    }

    stage('Apply') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'APPLY' }
        }
      }
      steps {
        input message: 'Approve to apply Terraform changes?'
        dir("${env.TF_DIR}") {
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }

    stage('Destroy') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'DESTROY' }
        }
      }
      steps {
        input message: 'Approve to destroy infrastructure?'
        dir("${env.TF_DIR}") {
          sh 'terraform destroy -auto-approve'
        }
      }
    }
  }
}
