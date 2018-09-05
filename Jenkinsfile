pipeline {
    agent { label 'docker-host' }

    stages {
        stage('sysinfo') {
            steps {
                echo 'NOTE: need a running docker installation and gnu make'
            }
        }
        stage('cirt-jenkins-master') {
            steps {
                echo 'Building jenkins master image'
                sh 'docker build jenkins-master -t cirt-jenkins-master'
            }
        }
        stage('cirt-jenkins-slave-base') {
            steps {
                echo 'Building generic jenkins slave base image'
                sh 'docker build jenkins-slave-base -t cirt-jenkins-slave-base'
            }
        }
        stage('cirt-jenkins-slave-kernel') {
            steps {
                echo 'Building CI-RT kernel build slave image'
                sh 'docker build jenkins-slave-kernel -t cirt-jenkins-slave-kernel'
            }
        }
    }
}
