pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            agent {
                docker {
                    image 'hadolint/hadolint:latest-debian'
                }
            }
            steps {
                sh 'hadolint Dockerfile | tee -a hadolint_${env.BUILD_NUMBER}.txt'
            }
            post {
                always {
                    archiveArtifacts 'hadolint_${env.BUILD_NUMBER}.txt'
                }
            }
        }
    }
}
