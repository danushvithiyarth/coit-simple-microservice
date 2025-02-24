pipeline {
    agent any
    tools {
        nodejs 'npm-23.8.0'
    }
    
    stages {
        stage("Install Dependency") {
            steps {
                dir('coit-frontend/') {
                    sh 'npm install --no-audit'
                }
            }
        }
        
        stage("Dependency Check") {
            parallel { 
                stage("Npm Dependency Check") { 
                    steps {
                        dir('coit-frontend/') {
                            sh 'npm audit' //--audit-level=high --audit-level=critical
                        }
                    }
                }
                
                stage("OWASP Dependency Check") { 
                    steps {
                        dir('coit-frontend/') {
                            sh '''
                                dependency-check.sh \
                                --scan /var/lib/jenkins/workspace/Multi-practice_develop/coit-frontend \
                                --out reports \
                                --format HTML,JSON \
                                --project "coit-frontend" \
                                --enableExperimental
                            '''
                        }
                    }
                }
            }
        }  
    }
}

        
        
        //stage("SonarQube Analysis") {
          //  steps {
            //    withSonarQubeEnv('sonar-server') {
              //      sh '''
                //      ${SCANNER_HOME}/bin/sonar-scanner \
                  //    -Dsonar.projectKey=nodekey \
                    //  -Dsonar.projectName=nodejs \
                      //-Dsonar.sources=. \
                     // -Dsonar.exclusions=**/*.java
                    //'''
        //        }
       //     }
       // }
       // stage("Build Docker Image") {
         //   steps {
          //      script {
          //          sh "docker build -t react-app:v1 -f coit-frontend/Dockerfile-multistage coit-frontend/"
           //         sh "docker images"
            //        sh "docker image prune -f"
            //    }
           // }
       // }
       // stage("Run Docker Container") {
         //   steps {
         //       script {
           //         sh "docker run -d -p 80:80 react-app:v1"
             //       sh "docker ps"
             //   }
           // }
      //  }


        // stage("Deploy"){
        //     steps{
        //         sh "cd coit-frontend && cp build/* /var/www/html/"
        //     }
        // }
        
    
   // post{
        // success{
        //     archiveArtifacts artifacts: '**/build', followSymlinks: false
        // }
        // failure{
        //     emailext body: '''Jenkins has failed to build the Job. Please find the information below.

        //                     Name of the Job: ${JOB_NAME}
        //                     Build that failed: ${BUILD_NUMBER}

        //                     Please check the logs at ${BUILD_URL}


        //                     Thanks
        //                     Jenkins''', subject: 'Failed ${JOB_NAME}', to: 'basil@coit.io'
        // }
   // }

