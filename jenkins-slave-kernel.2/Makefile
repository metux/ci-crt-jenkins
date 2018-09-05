
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run

DOCKER_TAG            ?= jenkins-slave-kernel
DOCKER_CONTAINER      ?= jenkins-slave-kernel-1

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	$(DOCKER_RUN) --rm --name $(DOCKER_CONTAINER) \
            $(DOCKER_TAG) 123123 one -url http://192.168.122.1:8080/
