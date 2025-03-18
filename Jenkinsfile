pipeline{ 
    agent{ 
        label "ansible-node"
    }
    stages{ 
        stage("Pinging"){ 
            steps{ 
                sh "ansible -m ping web"
            }
        }
    }
}