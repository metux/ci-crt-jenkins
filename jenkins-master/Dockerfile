FROM jenkins/jenkins
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG /etc/jenkins
RUN useradd libvirt-qemu
RUN apt-get update && apt-get install -y openssh-client openssh-server bash git python3-junit.xml python3-sqlalchemy python3-psycopg2 python3-numpy python3-pip libvirt0 libvirt-clients
RUN install-plugins.sh workflow-api pipeline-model-definition pipeline-utility-steps build-with-parameters timestamper lockable-resources ssh-slaves email-ext warnings git
RUN install-plugins.sh configuration-as-code configuration-as-code-support job-dsl
ADD libvirt-slave.hpi /usr/share/jenkins/ref/plugins/libvirt-slave.jpi
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY jenkins.yml /etc/jenkins/jenkins.yml
