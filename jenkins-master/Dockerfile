
## FIXME: this image is really huge - we should build a smaller one
FROM jenkins/jenkins

USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG /etc/jenkins
VOLUME /var/lib/postgreql
RUN useradd libvirt-qemu

## fixme: maybe we dont need virtinst
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        openssh-client \
        openssh-server \
        bash \
        git \
        python3-junit.xml \
        python3-sqlalchemy \
        python3-psycopg2 \
        python3-numpy \
        python3-pip \
        libvirt-clients \
        postgresql \
        nullmailer \
        virtinst

RUN install-plugins.sh \
        workflow-api \
        pipeline-model-definition \
        pipeline-utility-steps \
        build-with-parameters \
        timestamper \
        lockable-resources \
        ssh-slaves \
        email-ext \
        warnings \
        git \
        configuration-as-code \
        configuration-as-code-support \
        job-dsl \
        jdk-tool \
        docker-plugin \
        cloudbees-folder \
        permissive-script-security

## FIXME: remove permissive-script-security

ADD prebuilt/libvirt-slave.hpi /usr/share/jenkins/ref/plugins/libvirt-slave.jpi
ADD files/init.sh /usr/local/bin/init.sh
COPY files/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY files/jenkins.yml /etc/jenkins/jenkins.yml
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/init.sh"]

## install docker upstream
## FIXME: use dist packages instead
RUN curl -fsSL https://get.docker.com/ | sh

## give jenkins access to docker
RUN usermod -a -G docker jenkins
