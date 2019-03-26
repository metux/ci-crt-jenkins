
## FIXME: this image is really huge - we should build a smaller one
FROM jenkins/jenkins

USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG /etc/jenkins
VOLUME /var/lib/postgreql
RUN useradd libvirt-qemu

ARG LIBVIRT_PACKAGES=" \
    libvirt-clients \
    libvirt-clients \
    libvirt-daemon \
    libvirt-daemon-system \
    virtinst \
    nmap \
    qemu \
    dnsmasq \
    ebtables \
    file"

ARG DB_PACKAGES="postgresql"

ARG MAIL_PACKAGES="postfix"

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        ${LIBVIRT_PACKAGES} \
        ${DB_PACKAGES} \
        ${MAIL_PACKAGES} \
        openssh-client \
        openssh-server \
        bash \
        git \
        make \
        python3-junit.xml \
        python3-sqlalchemy \
        python3-psycopg2 \
        python3-numpy \
        python3-pip \
        python-pip \
        python-setuptools \
        quilt

## add symlink for ncat to nc
## FIXME: do NOT install netcat, but nmap (ncat)
RUN ln -sf /usr/bin/ncat /usr/bin/nc

## install python-junitparser
RUN pip install junitparser

## install mailer plugin (locally built)
RUN install-plugins.sh display-url-api
ADD prebuilt/mailer.hpi /usr/share/jenkins/ref/plugins/mailer.jpi

ADD prebuilt/libvirt-slave.hpi /usr/share/jenkins/ref/plugins/libvirt-slave.jpi

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
        permissive-script-security \
        ${MAILER_PLUGIN_DEPS}

## FIXME: remove permissive-script-security

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/init.sh"]

## install docker upstream
## FIXME: use dist packages instead
RUN curl -fsSL https://get.docker.com/ | sh

## give jenkins access to docker
RUN usermod -a -G docker jenkins

ADD files/sshd_config /etc/ssh/sshd_config
RUN chmod u=rw,g=r /etc/ssh/sshd_config

## create ssh key and let root call in to itself
RUN mkdir -p ~/.ssh && ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

VOLUME /dut

COPY files/qemu.conf           /etc/libvirt/qemu.conf
COPY files/init.sh             /usr/local/bin/init.sh
COPY files/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY files/jenkins.yml         /etc/jenkins/jenkins.yml
COPY files/virt-hosts          /usr/bin

COPY files/vm-testx86          /vm-testx86

### FIXME: this should go to slave
RUN apt-get -y install python-yaml
