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
                chmod 777 -R */*
                cp /root/aks-cluster/test/copy-infra.sh ./
                chmod a+x copy-infra.sh
                ./create-infra.sh
    			    """
            }
        }

        stage('Creating Infra in Azure') {
            steps {                
              sh """
               cp /root/aks-cluster/test/create-infra.sh ./
               chmod a+x create-infra.sh
               ./deploy-infra.sh
  	        	"""
            }
        }
        
        stage('Deploy Infra in Azure') {
            steps {
              sh """
               cp /root/aks-cluster/test/deploy-infra.sh ./
               chmod a+x deploy-infra.sh
               ./deploy-infra.sh
    			    """
            }
        }
    }
}
