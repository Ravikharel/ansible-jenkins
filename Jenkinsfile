pipeline{ 
    agent{ 
        label "ansible-node"
    }
    stages{ 
        stage("Pinging"){ 
            steps{ 
                sh '''
                cd /home/vagrant/ansible
                ansible-playbook playbook.yml
                '''
            }
        }
    }
}