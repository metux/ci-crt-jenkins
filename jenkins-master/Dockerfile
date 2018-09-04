FROM jenkins/jenkins
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG /etc/jenkins
VOLUME /var/lib/postgreql
RUN useradd libvirt-qemu
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y openssh-client openssh-server bash git python3-junit.xml python3-sqlalchemy python3-psycopg2 python3-numpy python3-pip libvirt0 libvirt-clients postgresql nullmailer
RUN install-plugins.sh workflow-api pipeline-model-definition pipeline-utility-steps build-with-parameters timestamper lockable-resources ssh-slaves email-ext warnings git configuration-as-code configuration-as-code-support job-dsl
ADD libvirt-slave.hpi /usr/share/jenkins/ref/plugins/libvirt-slave.jpi
ADD init.sh /usr/local/bin/init.sh
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY jenkins.yml /etc/jenkins/jenkins.yml
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/init.sh"]
