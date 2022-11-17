pipeline {
    agent any
    tools {
        nodejs '16.18.0'
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Step1. Make script files executable.'
                sh 'chmod +x software/installer/install.sh'
                sh 'chmod +x software/installer/fibstack/uninstall.sh'
                sh 'ls'
                sh 'ls -la software/installer'
                sh 'ls -la software/installer/fibstack'
                sh 'npm version'
                sh 'ng version'
            }
        }

        stage('Front-end Build') {
            steps {
                dir('software/ng-webapp') {
                    sh 'npm install'
                    sh 'ng build --prod --build-optimizer --baseHref="/static/"'
                }
            }
        }

        stage('Prepare Installation Files') {
            steps {
                sh 'ls -la software/ng-webapp/dist/'
            }
        }
    }
}