
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run

DOCKER_TAG            ?= jenkins-cirt
DOCKER_JENKINS_VOLUME ?= jenkins-cirt-data-9
DOCKER_PSQL_VOLUME    ?= jenkins-cirt-psql-4
DOCKER_CONTAINER      ?= jenkins1

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	$(DOCKER_RUN) --rm --name $(DOCKER_CONTAINER) \
            -p 8080:8080 \
            -v "/var/run/docker.sock:/var/run/docker.sock" \
            -v "$(DOCKER_JENKINS_VOLUME):/var/jenkins_home" \
            -v "$(DOCKER_PSQL_VOLUME):/var/lib/postgresql" \
            $(DOCKER_TAG)
