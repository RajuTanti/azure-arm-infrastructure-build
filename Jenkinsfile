#!/usr/bin/env groovy
pipeline {

    /*
     * Run everything on an existing agent configured with a label 'docker'.
     * This agent will need docker, git and a jdk installed at a minimum.
     */
    agent {
        node {
            label 'master'
        }
    }

    // using the Timestamper plugin we can add timestamps to the console log
    options {
        timestamps()
    }

    environment {
        //Use Pipeline Utility Steps plugin to read information env variables
        IMAGE = "image"
        VERSION = "version"
    }

    stages {
        stage('Copy Infra code') {            
            steps {
              sh """
                sudo cp /root/aks-cluster/test/copy-infra.sh ./
                sudo chmod a+x copy-infra.sh
                sudo ./create-infra.sh
    			    """
            }
        }

        stage('Creating Infra in Azure') {
            steps {                
              sh """
               sudo cp /root/aks-cluster/test/create-infra.sh ./
               sudo chmod a+x create-infra.sh
               sudo ./deploy-infra.sh
  	        	"""
            }
        }
        
        stage('Deploy Infra in Azure') {
            steps {
              sh """
               sudo cp /root/aks-cluster/test/deploy-infra.sh ./
               sudo chmod a+x deploy-infra.sh
               sudo ./deploy-infra.sh
    			    """
            }
        }
    }
}
