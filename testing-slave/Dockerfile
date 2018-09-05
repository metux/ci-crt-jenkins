FROM jenkins-slave-kernel

#ARG KERNEL_REPO=/home/mirror/kernel
#ARG KERNEL_URL=git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git

#USER root

#RUN export DEBIAN_FRONTEND=noninteractive && \
#    apt-get update && \
#    apt-get install --no-install-recommends -y git make
#
#RUN useradd -c "git mirrors" -d /home/mirror -m mirror
#
#USER mirror
#RUN git init --bare ${KERNEL_REPO}
#RUN cd ${KERNEL_REPO} && git remote add origin ${KERNEL_URL}
#RUN cd ${KERNEL_REPO} && git remote update

USER root

ENTRYPOINT ["/sbin/init"]
