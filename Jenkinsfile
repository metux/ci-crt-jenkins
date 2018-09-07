pipeline {
    agent { label 'docker-host' }

    stages {
        stage('sysinfo') {
            steps {
                echo 'NOTE: need a running docker installation and gnu make'
            }
        }

        stage('cirt-jenkins-mini-build') {
            steps {
                echo 'Building jenkins plugin builder image'
                sh 'docker build 'jenkins-mini-build -t cirt-jenkins-mini-build'
            }
        }
        stage('cirt-jenkins-plugins') {
            steps {
                echo 'Building jenkins plugins'
                sh 'cd jenkins-mini-build && make run'
                stash includes: 'jenkins-mini-build/work/plugins', name: 'jenkins-plugins'
            }
        }
        stage('cirt-jenkins-master') {
            steps {
                unstash 'jenkins-plugins'
                echo 'Building jenkins master image'
                sh 'find -name "*.hpi"'
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
