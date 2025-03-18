pipeline{ 
    agent{ 
        label "ansible-node"
    }
    stages{ 
        stage("Copying the files to the web server"){ 
            steps{ 
                sh '''
                cd $WORKSPACE
                ansible-playbook playbook.yml
                '''
            }
        }
    }
}
