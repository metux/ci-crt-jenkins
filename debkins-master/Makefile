
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run

DOCKER_TAG            ?= debkins-master
DOCKER_JENKINS_VOLUME ?= debkins-data-9
DOCKER_CONTAINER      ?= debkins1

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	$(DOCKER_RUN) --rm --name $(DOCKER_CONTAINER) \
            -p 8080:8080 \
            --privileged \
            -v "/var/run/docker.sock:/var/run/docker.sock" \
            -v "$(DOCKER_JENKINS_VOLUME):/var/jenkins_home" \
            --mount type=tmpfs,destination=/var/jenkins_home/war \
            --mount type=tmpfs,destination=/var/jenkins_home/plugins \
            $(DOCKER_TAG)
