pipeline {
//    agent { label 'linux' }
    agent { label 'linux' }

    options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    }

    environment {
        DOCKER_CRED = credentials('dennys9415-docker')
        NODE_VERSION = '14.18.2'
    }
    tools{
        nodejs "Node-14-18-2"
    }
    stages {
        stage('Init') {
            steps{
                echo "loading the function file"
                script{
                    gv = load "script.groovy"
                }                
            }        
        }
        stage('Build') {
            steps{
                echo "the version of node that you're using is Node ${NODE_VERSION}"
                echo "making the building of a new image"
                echo "the image that is build is dennys9415/jenkinsreact:latest"
//                sh 'docker build -t dennys9415/jenkinsreact:latest .'
                script {
                    gv.build()
                }
            }        
        }
        stage('Login') {
            steps{
                echo 'Login to the Docker Hub Account'
                echo "Docker Hub Account owned by Dennys Cedeno"
//                sh 'echo $DOCKER_CRED_PSW | docker login -u $DOCKER_CRED_USR --password-stdin'
                script {
                    gv.login()
                }
            }        
        }
        stage('Push') {
            steps{
                echo 'Pushing the App in a Docker Image'
//                sh 'docker push dennys9415/jenkinsreact:latest'
                script {
                    gv.push()
//                    gv.logout()
                }
            }        
        }
        stage('SSH') {
            steps{
                echo 'command with ssh'
                sh "ssh root@173.255.236.51 '/home/dockerreact.sh'"
            }        
        }
    }
    post {
        always{
            echo 'Login Out of the Account'
            sh 'docker logout'
//            script {
//               gv.logout()
//            }
        }
    }
}