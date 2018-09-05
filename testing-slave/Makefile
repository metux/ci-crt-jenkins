
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run

DOCKER_TAG            ?= jenkins-foo
DOCKER_JENKINS_VOLUME ?= jenkins-cirt-data-9
DOCKER_PSQL_VOLUME    ?= jenkins-cirt-psql-4
DOCKER_CONTAINER      ?= jenkins-foo1

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	$(DOCKER_RUN) --rm --name $(DOCKER_CONTAINER) \
            $(DOCKER_TAG)
