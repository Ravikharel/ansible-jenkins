pipeline{ 
    agent{ 
        label "ansible-node"
    }
    stages{ 
        stage("Pinging"){ 
            steps{ 
                sh '''
                cd $WORKSPACE
                ansible-playbook playbook.yml
                '''
            }
        }
    }
}
