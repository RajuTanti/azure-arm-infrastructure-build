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
				echo 'copyfile'
				"""
            }
        }

        stage('Creating Infra in Azure') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            steps {
                /*
                 * Multiline strings can be used for larger scripts. 
                 */
                sh """
				
        """
            }
        }
    }
}
