pipeline {
    agent any
    tools {
        nodejs '16.18.0'
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Step 1. Make script files executable.'
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
                    echo 'Step 2. Build the front-end application.'
                    sh 'npm install'
                    sh 'ng build --prod --build-optimizer --baseHref="/static/"'
                }
            }
        }

        stage('Prepare Installation Files') {
            steps {
                echo 'Step 3. Copy files to the installation folder.'
                echo '3a. Copy backend web app.'
                sh 'cp software/py_webapp/webapp.py software/installer/fibstack/webapp.py'
                echo '3b. Copy C library and CLI source files'
                sh 'cp -a software/libfibstack/. software/installer/'
                sh 'cp -a software/fibstackcli/. software/installer/'

                sh 'ls -la software/ng-webapp/dist/'
                sh 'ls -la software/ng-webapp/dist/ng-webapp/'
            }
        }

        stage('Finalize') {
            steps {
                sh 'ls -la software/installer'
                sh 'ls -la software/installer/fibstack'
            }
        }
    }
}