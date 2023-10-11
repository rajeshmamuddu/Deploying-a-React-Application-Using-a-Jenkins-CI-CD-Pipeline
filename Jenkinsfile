pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/rajeshmamuddu/Deploying-a-React-Application-Using-a-Jenkins-CI-CD-Pipeline.git']])
                sh 'npm install'
                // sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                // sh 'npm run test'
                echo "Test"
            }
        }
        
        stage('Build and Push Docker Image') {
         environment {    
               REGISTRY_CREDENTIALS = credentials('docker-cred')
           steps {
               script {
                 sh 'docker build -t reactimage .'
                 sh 'docker tag reactimage:latest rajeshreactimage/dev:latest'
                 docker.withRegistry('https://index.docker.io/v1/', "docker-cred") {
                 dockerImage.push()
                 }      
            }
        }
      }
    }
       stage('Deploy') {
            steps {  
                script {
                   def dockerCmd = 'docker run -itd --name My-first-container -p 80:5000 rajeshreactimage/dev:latest'
                   sshagent(['sshkeypair']) {
                   sh "ssh -o StrictHostKeyChecking=no ubuntu@13.233.250.24 ${dockerCmd}"
                   }
                }
            }
       }
    }
}
