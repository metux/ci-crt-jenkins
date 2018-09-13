FROM cirt-jenkins-slave-base

ARG KERNEL_REPO=/home/mirror/kernel
ARG KERNEL_URL=git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git

USER root

ADD files/sudoers.jenkins /etc/sudoers.d/sudoers.jenkins
ADD files/linutronix.list /etc/apt/sources.list.d/linutronix.list
ADD files/linutronix.gpg  /etc/apt/trusted.gpg.d/linutronix.gpg

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        git \
        make \
        gcc \
        ncurses-dev \
        bc \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        crossbuild-essential-armhf \
        crossbuild-essential-mipsel \
        crossbuild-essential-powerpc \
        crossbuild-essential-ppc64el \
        procps \
        sudo \
        pyjutest \
        lzop \
        quilt

RUN useradd -c "git mirrors" -d /home/mirror -m mirror

USER mirror
RUN git init --bare ${KERNEL_REPO} && cd ${KERNEL_REPO} && git remote add origin ${KERNEL_URL} && git remote update

USER root

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        fakeroot
