#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-nextthingco/chiptainer_octoprint}

docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
