#!/bin/bash

/etc/init.d/ssh start

export JENKINS_OPTS="-Dpermissive-script-security.enabled=true"
export JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
exec /usr/local/bin/jenkins.sh
