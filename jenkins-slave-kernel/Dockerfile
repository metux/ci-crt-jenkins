
## FIXME: this image is really huge - we should build a smaller one
FROM metux/devuan-jessie-micro-amd64

USER root

## fixme: maybe we dont need virtinst
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        openssh-client \
        openssh-server \
        bash \
        git \
        gcc \
        make

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
