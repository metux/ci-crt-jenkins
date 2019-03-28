
DOCKER       ?= docker
DOCKER_BUILD ?= $(DOCKER) build
DOCKER_RUN   ?= $(DOCKER) run
DOCKER_TAG   ?= debkins-plugin-build

build:
	$(DOCKER_BUILD) . -t $(DOCKER_TAG)

run:
	rm -Rf work/build
	mkdir -p work
	$(DOCKER_RUN) -u $(shell id -u):$(shell id -g) -v $(CURDIR)/work:/work -w /work $(DOCKER_TAG) /build-plugins.sh
	@echo "listing workdir"
	find $(CURDIR)/work || true
	@echo "check for plugins"
	ls -la  work/plugins
	echo "finished"

clean:
	echo "Cleaning ..."
	rm -Rf work
