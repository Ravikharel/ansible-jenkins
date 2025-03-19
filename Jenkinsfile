pipeline {
    agent any
    environment {
        dockerImage = "ravikharel/compose"
    }
    stages {
        stage('Building the image') {
            steps {
                script {
                    sh "docker image build -t ${dockerImage}:${BUILD_NUMBER} ."
                }
            }
        }
        stage('Scanning the image') {
            steps {
                sh 'trivy image --exit-code 1 --severity HIGH,CRITICAL --ignore-unfixed $dockerImage:$BUILD_NUMBER'
            }
        }
        stage('Pushing the docker image to the docker hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    sh "docker push ${dockerImage}:${BUILD_NUMBER}"
                }
            }
        }
        stage('Playing the playbook') {
            steps {
                sh '''
                    cd $WORKSPACE
                    ansible-playbook playbook.yml -e "workspace=$WORKSPACE" -e "number=$BUILD_NUMBER" -e "image=$dockerImage"
                '''
            }
        }
    }
    post {
        always {
            mail to: 'kharel1248@gmail.com',
                 subject: "Job '${JOB_NAME}' (${BUILD_NUMBER}) status",
                 body: "Please go to ${BUILD_URL} and verify the build"
        }
        success {
            emailext(
                to: 'kharel1248@gmail.com',
                subject: "Jenkins Build ${JOB_NAME} #${BUILD_NUMBER} Success",
                body: """The build was successful.
                Check the job at ${BUILD_URL}"""
            )
        }
        failure {
            emailext(
                to: 'kharel1248@gmail.com',
                subject: "Jenkins Build ${JOB_NAME} #${BUILD_NUMBER} Failed",
                body: """The build failed. Please check the logs at ${BUILD_URL}"""
            )
        }
    }
}