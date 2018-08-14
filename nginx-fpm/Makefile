IMAGE_NAME := custom-nginx-fpm
DOCKER_REGISTRY := <some registry>

.PHONY: build
build:
	docker build -t ${IMAGE_NAME}:${BRANCH_NAME} -f Dockerfile.${BRANCH_NAME} .

.PHONY: deploy
deploy:
	docker tag ${IMAGE_NAME}:${BRANCH_NAME} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME}
	docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME}

