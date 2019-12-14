#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library("cals") _

buildConfig {
  dockerNode {
    checkout scm

    def img = docker.image("node:12")
    img.pull()
    img.inside {
      stage("Install dependencies") {
        sh "npm ci"
      }

      stage("Validate") {
        sh "./validate.sh"
      }
    }
  }
}
