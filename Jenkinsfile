pipeline{ 
    agent{ 
        label "ansible-node"
    }
    stages{ 
        stage("Pinging"){ 
            steps{ 
                sh '''

                ansible-playbook playbook.yml
                '''
            }
        }
    }
}