
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run
DOCKER_TAG   ?= cirt-jenkins-mini-build

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	rm -Rf work/build
	mkdir -p work
	$(DOCKER_RUN) -u $(shell id -u):$(shell id -g) -v $(CURDIR)/work:/work -w /work $(DOCKER_TAG) /build-plugins.sh
	echo "listing built plugins"
	find / -name "*.hpi" || true
	find / -name "*.jpi" || true
	echo "finished"

clean:
	rm -Rf work
