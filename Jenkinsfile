node {
    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Build') {
            echo 'submission-cicd-pipeline-rabadi: Build stage in progress...'
            sh 'npm install'
        }
        stage('Test') {
            echo 'submission-cicd-pipeline-rabadi: Test stage in progress...'
            sh './jenkins/scripts/test.sh'
        }
        stage('ManualApproval') {
            echo 'submission-cicd-pipeline-rabadi: Manual Approval stage in progress...'
            script {
                try {
                    env.theInput = input message: 'Lanjutkan ke tahap Deploy?'
                    env.theInput = 'Proceed'
                } catch(e) {
                    env.theInput = 'Abort'                    
                }
            }
        }
        stage('Deploy') {        
            if (env.theInput == 'Proceed') {
                echo 'submission-cicd-pipeline-rabadi: Deploy stage in progress...'
                sh './jenkins/scripts/deliver.sh' 
                sh 'sleep 1m'
                sh './jenkins/scripts/kill.sh' 
                echo 'done...'
            } else {
                echo 'submission-cicd-pipeline-rabadi: Approval is rejected and Deployment is cancelled...'
                sh 'sleep 10'
                echo 'done...'                
            }             
        }
    }
}
