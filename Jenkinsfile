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
                chmod a+x ./copy-infra.sh              
                ./copy-infra.sh
                chmod 777 -R */*
    			    """
            }
        }

        stage('Creating Infra in cloud') {
            steps {                
              sh """
               ./create-infra.sh
  	        	"""
            }
        }
        
        stage('Deploy Infra in cloud') {
            steps {
              sh """
               ./deploy-infra.sh
    			    """
            }
        }
    }
}
