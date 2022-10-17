pipeline {
    agent { label 'Linux' }
    stages {
        stage('downloading repo from github') {
            steps {
                echo "Downloading Repo"
                git branch: 'main', url: 'https://github.com/David-135/test.git'
                sh 'echo second step'
                sh 'sleep 1'
                sh '''
                echo 'working on'
                echo 'slave node'
                '''
            }
        }
        stage('Creating Docker Image') {
            steps {
                echo "Creating docker image from Dockerfile"
                sh 'docker build -t dergashev/test_app:2.0 .'
         
            }
        }
        stage('Pushing Docker Image Into Official Docker Repository') {
            steps {
                echo "Creating docker image from Dockerfile"
                sh 'docker login -u dergashev -p dckr_pat_SMNATM8Jp1AzvC_c60UopGT3ZLg'
                sh 'docker push dergashev/test_app:2.0'
                sh 'echo "pushing image is finished"'
            }
        }
        stage('Running Docker Image as Container') {
            steps {
                echo "Running Docker Image as Container"
                sh 'docker run -dit -p 80:80 dergashev/test_app:2.0'
                sh 'echo "Application is running at port:80"'
                sh 'docker ps'
            }
        }
    }
}
