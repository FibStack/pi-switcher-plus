pipeline {
    agent any
    tools {
        nodejs '16.18.0'
    }
    options {
        // Skip the default checkout step. Required for clean up before the build
        skipDefaultCheckout(true)
    }

    stages {
        stage('Setup') {
            steps {
                cleanWs() // Clean up before the build
                checkout scm // checkout the source files
                echo 'Step 1. Make script files executable.'
                sh 'chmod +x software/installer/install.sh'
                sh 'chmod +x software/installer/fibstack/uninstall.sh'

                sh 'curl -LJO https://github.com/megastep/makeself/releases/download/release-2.4.5/makeself-2.4.5.run --output makeself-2.4.5.run'
                sh 'chmod +x makeself-2.4.5.run'
                sh './makeself-2.4.5.run'
            }
        }

        stage('Front-end Build') {
            steps {
                dir('software/ng-webapp') {
                    echo 'Step 2. Build the front-end application.'
                    sh 'npm install'
                    sh 'ng build --configuration production --build-optimizer --base-href /static/'
                }
            }
        }

        stage('Prepare Installation Files') {
            steps {
                echo 'Step 3. Copy files to the installation folder.'
                echo '3a. Copy backend web app.'
                sh 'cp software/py_webapp/webapp.py software/installer/fibstack/webapp.py'

                echo '3b. Copy C library and CLI source files'
                sh 'cp -a software/libfibstack/. software/installer/libfibstack/'
                sh 'cp -a software/fibstackcli/. software/installer/fibstackcli/'

                echo '3c. Copy Python library files.'
                sh 'cp -a software/fibstacklib_cffi/. software/installer/fibstacklib_cffi/'
                sh 'cp -a software/fibstacklibpy/. software/installer/fibstacklibpy/'

                echo '3d. Copy front-end compiled files'
                sh 'cp -a software/ng-webapp/dist/dashboard-ui/. software/installer/fibstack/static/'
            }
        }

        stage('Build the installers') {
            steps {
                echo '4. Build tar.gz archive.'
                tar file: 'fibstack-package.tar.gz', dir: 'software/installer'

                echo '5. Build .run installer.'
                sh 'makeself-2.4.5/makeself.sh software/installer/ fibstack_package.run "Fibstack Package" ./install.sh'
            }
        }
    }
}