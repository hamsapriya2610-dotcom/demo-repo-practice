pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubcrederntials', url: 'https://github.com/hamsapriya2610-dotcom/demo-repo-practice.git']])
        }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Maven Test') {
            steps {
                sh 'mvn test'
            }
        }
    stage('docker build') {
        steps {
            sh 'docker build -t demo-repo-practice .'
            sh 'docker tag demo-repo-practice hamsapriya2610/demo-repo-practice'

}
        }
stage('docker push') {
    steps {
         script {
        withCredentials([string(credentialsId: 'dckrpsd', variable: 'dockerhubcredentialsdemo')]) {
           
                        sh '''
                        docker login -u hamsapriya2610 -p ${dockerhubpsd}
                        docker image push hamsapriya2610 /demo-repo-practice:v.${BUILD_NUMBER}
                        docker rmi shopping:v.${BUILD_NUMBER}
                        docker rmi hamsapriya2610 /demo-repo-practice:v.${BUILD_NUMBER}
                        '''
        }
}
    }
}
stage('Deploy Docker image') {
            steps {
                sh '''
                docker ps -q -f name=shopping-container && docker stop shopping-container && docker rm shopping-container || echo "Container not found or already stopped."
                docker run -d -p 8282:8282 --name shopping-container hamsapriya2610/demo-repo-practice:v.${BUILD_NUMBER}
                '''
            }
        }
    }
}

 


    


