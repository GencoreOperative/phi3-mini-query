project=gencore/phi3-mini-query
git=$(shell git rev-parse --short HEAD)

all: build

.PHONY: build

build:
	@echo "Building Image"
	docker build docker \
		--tag $(project):$(git) \
		--tag $(project):latest

build-test: build
	@echo "Building Test Image"
	docker build test \
		--tag $(project):test-$(git) \
		--tag $(project):test-latest

publish:
	@echo "Pushing to DockerHub"
	@sh utils/docker-login
	docker push $(project):$(git)
	docker push $(project):latest
	docker push $(project):test-$(git)
	docker push $(project):test-latest