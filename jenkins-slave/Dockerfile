FROM metux/devuan-ascii-micro-amd64

ARG JENKINS_USER=jenkins
ARG JENKINS_GROUP=jenkins
ARG JENKINS_UID=10000
ARG JENKINS_GID=10000

ARG JENKINS_AGENT_VERSION=3.23
ARG JENKINS_AGENT_WORKDIR=/home/${JENKINS_USER}/agent
ARG JENKINS_AGENT_URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_AGENT_VERSION}/remoting-${VERSION}.jar

USER root

VOLUME /var/cache/apt

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV HOME /home/${JENKINS_USER}

RUN mkdir -p /usr/local/bin

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y openjdk-8-jdk-headless curl ca-certificates && \
    mkdir -p /usr/share/jenkins && \
    curl --create-dirs -sSLo /usr/share/jenkins/slave.jar ${JENKINS_AGENT_URL} && \
    chmod 755 /usr/share/jenkins && \
    chmod 644 /usr/share/jenkins/slave.jar && \
    apt-mark auto curl && \
    apt-get autoremove -y

COPY files/docker-java-home /usr/local/bin/docker-java-home
COPY files/jenkins-slave /usr/local/bin/jenkins-slave

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN mkdir -p /home && \
    groupadd -g ${JENKINS_GID} ${JENKINS_GROUP} && \
    useradd -c "Jenkins user" -d $HOME -u ${JENKINS_UID} -g ${JENKINS_GID} -m ${JENKINS_USER}

USER ${JENKINS_USER}
ENV JENKINS_AGENT_WORKDIR=${JENKINS_AGENT_WORKDIR}
RUN mkdir /home/${JENKINS_USER}/.jenkins && mkdir -p ${JENKINS_AGENT_WORKDIR}

VOLUME /home/${JENKINS_USER}/.jenkins
VOLUME ${JENKINS_AGENT_WORKDIR}
WORKDIR /home/${JENKINS_USER}

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
