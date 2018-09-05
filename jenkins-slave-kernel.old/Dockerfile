FROM metux/devuan-ascii-micro-amd64

USER root

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        curl \
        ca-certificates \
        openjdk-8-jdk-headless \
        git

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN mkdir -p /usr/local/bin && { \
	echo '#!/bin/sh'; \
	echo 'set -e'; \
	echo; \
	echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV HOME /home/${user}
RUN mkdir -p /home
RUN groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d $HOME -u ${uid} -g ${gid} -m ${user}

ARG VERSION=3.23
ARG AGENT_WORKDIR=/home/${user}/agent

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY files/jenkins-slave /usr/local/bin/jenkins-slave

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]

## mirror git repo
USER root
RUN useradd -c "git mirrors"  -d /home/mirror -m mirror
USER mirror
RUN git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git /home/mirror/kernel
