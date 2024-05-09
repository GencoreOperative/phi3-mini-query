project=$(shell cat project.name)
git= $(shell git rev-parse --short HEAD)

all: build

.PHONY: build

build:
	@echo "Building Base Image"
	docker build docker \
		--tag $(project):latest
#		--tag $(project):$(git) \

#publish:
#	@echo "Pushing to DockerHub"
#	@sh utils/docker-login
#	docker push $(project):$(git)
#	docker push $(project):latest