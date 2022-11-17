pipeline {
    agent any

    stages {
        stage('setup') {
            steps {
                echo 'Step1. Make script files executable.'
                sh 'chmod +x software/installer/install.sh'
                sh 'chmod +x software/installer/fibstack/uninstall.sh'
                sh 'ls'
                sh 'ls -la software/installer'
                sh 'ls -la software/installer/fibstack'
            }
        }
    }
}