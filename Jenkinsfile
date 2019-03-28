pipeline {
    agent { label 'docker-host' }

    stages {
        stage('sysinfo') {
            steps {
                echo 'NOTE: need a running docker installation and gnu make'
            }
        }
        stage('debkins-mini-build') {
            steps {
                echo 'Building jenkins plugin builder image'
                sh 'docker build debkins-mini-build -t debkins-mini-build'
            }
        }
        stage('debkins-plugins') {
            steps {
                echo 'Building jenkins plugins'
                sh 'cd debkins-mini-build && make run'
                echo 'Extracting built plugins'
                sh 'find *.hpi'
                stash includes: 'debkins-mini-build/work/plugins', name: 'debkins-plugins'
            }
        }
        stage('debkins-master') {
            steps {
                unstash 'debkins-plugins'
                echo 'Building jenkins master image'
                sh 'find -name "*.hpi"'
                sh 'docker build debkins-master -t debkins-master'
            }
        }
        stage('debkins-slave-base') {
            steps {
                echo 'Building generic jenkins slave base image'
                sh 'docker build debkins-slave-base -t debkins-slave-base'
            }
        }
        stage('debkins-slave-kernel') {
            steps {
                echo 'Building CI-RT kernel build slave image'
                sh 'docker build debkins-slave-kernel -t debkins-slave-kernel'
            }
        }
    }
}
