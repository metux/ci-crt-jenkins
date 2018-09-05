pipeline {
    agent any

    stages {
        stage('jenkins-master') {
            steps {
                echo 'Building jenkins master image'
                sh 'ls -la'
            }
        }
        stage('jenkins-slave') {
            steps {
                echo 'Building generic jenkins slave image'
            }
        }
        stage('jenkins-slave-kernel') {
            steps {
                echo 'Building CI-RT kernel build slave image'
            }
        }
    }
}
