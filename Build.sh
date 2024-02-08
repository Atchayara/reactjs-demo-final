#!/bin/bash

docker login -u $DOCKER_USER -p $DOCKER_PASS

IMAGE_NAME="reactapp"
TAG="latest"

DOCKERFILE="Dockerfile"

docker build -t "${IMAGE_NAME}:${TAG}" -f "${DOCKERFILE}" .

docker stop react
doker rm react

