FROM metux/devuan-ascii-micro-amd64

USER root

VOLUME /var/cache/apt

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN mkdir -p /usr/local/bin

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y openjdk-8-jdk-headless curl ca-certificates curl maven git gradle && \
    apt-get autoremove -y

## this the volume for the build output
VOLUME /output

ADD files/build-plugin-mailer.sh /
ADD files/build-plugin-libvirt-slave.sh /
ADd files/build-plugin-aptly-publisher.sh /
ADD files/build-plugins.sh /
