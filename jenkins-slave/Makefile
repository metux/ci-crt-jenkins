
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run
DOCKER_TAG   ?= jenkins-slave-base

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)
