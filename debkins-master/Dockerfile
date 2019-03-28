
## FIXME: this image is really huge - we should build a smaller one
FROM jenkins/jenkins

MAINTAINER info@metux.net
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV CASC_JENKINS_CONFIG /etc/jenkins

#ARG MAIL_PACKAGES="postfix"
ARG MAIL_PACKAGES=""

# these packages are required if the master is also acting as build node
ARG BUILD_NODE_PACKAGES="\
    sudo \
    make \
    gcc \
    libc6-dev \
    bison \
    flex \
    dpkg-dev \
    apt-utils \
    uuid-runtime \
"

#        openssh-client \
#        openssh-server \
#        python3-junit.xml \
#        python3-sqlalchemy \
#        python3-psycopg2 \
#        python3-numpy \
#        python3-pip \
#        python-pip \
#        python-setuptools \

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        ${MAIL_PACKAGES} \
        ${BUILD_NODE_PACKAGES} \
        bash \
        git \
        python-yaml \
        && \
    apt-get autoremove -y && \
    apt-get autoclean

## add symlink for ncat to nc
## FIXME: do NOT install netcat, but nmap (ncat)
RUN ln -sf /usr/bin/ncat /usr/bin/nc

## install python-junitparser
# RUN pip install junitparser

## install mailer plugin (locally built)
RUN install-plugins.sh display-url-api
# ADD prebuilt/mailer.hpi /usr/share/jenkins/ref/plugins/mailer.jpi

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
        multiple-scms \
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

# VOLUME /dut

COPY files/init.sh             /usr/local/bin/init.sh
COPY files/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY files/jenkins.yml         /etc/jenkins/jenkins.yml

# fixme: these should be replaced
COPY files/gnupg/*             /root/.gnupg/

# on this volume we store the temporary source trees, shared between jenkins and build containers
#VOLUME /dck-buildpackage.tmp
#ENV DEBKINS_SRC_VOLUME
