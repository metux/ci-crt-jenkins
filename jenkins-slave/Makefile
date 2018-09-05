
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_TAG   ?= cirt-jenkins-slave-base

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)
