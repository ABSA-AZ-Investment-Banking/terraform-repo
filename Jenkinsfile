pipeline {
  agent any

  parameters {
    choice(
      name: 'STAGE_TO_RUN',
      choices: ['ALL', 'BUILD', 'TEST', 'DEPLOY'],
      description: 'Select which stage(s) to run'
    )
  }

  stages {
    stage('Build') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'BUILD' }
        }
      }
      steps {
        echo "Running BUILD stage..."
        // your build commands go here
        sh 'echo Building application...'
      }
    }

    stage('Test') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'TEST' }
        }
      }
      steps {
        echo "Running TEST stage..."
        // your test commands
        sh 'echo Running unit tests...'
      }
    }

    stage('Deploy') {
      when {
        anyOf {
          expression { params.STAGE_TO_RUN == 'ALL' }
          expression { params.STAGE_TO_RUN == 'DEPLOY' }
        }
      }
      steps {
        echo "Running DEPLOY stage..."
        // your deploy logic
        sh 'echo Deploying to environment...'
      }
    }
  }
}
