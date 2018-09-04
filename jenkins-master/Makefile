
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run
DOCKER_TAG   ?= jenkins-cirt
DOCKER_VOL   ?= jenkins-cirt-data-3
DOCKER_NAME  ?= jenkins1

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	$(DOCKER_RUN) --rm --name $(DOCKER_NAME) -p 8080:8080 -v $(DOCKER_VOL):/var/jenkins_home $(DOCKER_TAG)
