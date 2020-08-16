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
                cp /tmp/test/copy-infra.sh ./                
                ./copy-infra.sh
    			    """
            }
        }

        stage('Creating Infra in cloud') {
            steps {                
              sh """
              chmod 777 -R */*
               cp /tmp/test/create-infra.sh ./
               ./create-infra.sh
  	        	"""
            }
        }
        
        stage('Deploy Infra in cloud') {
            steps {
              sh """
              chmod 777 -R */*
               cp /tmp/test/deploy-infra.sh ./
               ./deploy-infra.sh
    			    """
            }
        }
    }
}
