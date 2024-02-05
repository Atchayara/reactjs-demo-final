#!/bin/bash

IMAGE_NAME="reactapp"
TAG="latest"

DOCKERFILE="Dockerfile"

docker build -t "${IMAGE_NAME}:${TAG}" -f "${DOCKERFILE}" .

if [ $? -eq 0 ]; then
	echo "Docker image built successfully ${IMAGE_NAME}:${TAG}"
else
	echo "Error"
	exit 1
fi

