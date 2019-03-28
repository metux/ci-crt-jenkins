#!/bin/bash

/etc/init.d/ssh start

export JENKINS_OPTS="-Dpermissive-script-security.enabled=true"
exec /usr/local/bin/jenkins.sh
