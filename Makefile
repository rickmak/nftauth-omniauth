GIT_SHA ?= $(shell git rev-parse --short=8 HEAD)
DOCKER_REGISTRY ?= gcr.io/oursky-kube

.PHONY: docker-build
docker-build:
	docker build . -f Dockerfile \
		-t $(DOCKER_REGISTRY)/nftauth-omniauth:$(GIT_SHA)

.PHONY: docker-push
docker-push:
	docker push $(DOCKER_REGISTRY)/nftauth-omniauth:$(GIT_SHA)
