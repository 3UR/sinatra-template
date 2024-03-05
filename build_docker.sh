#!/bin/bash

log() {
    color=$1
    message=$2
    echo -e "\e[${color}m${message}\e[0m"
}

IMAGE_NAME=sinatra-app
IMAGE_TAG=dev

# build the image
docker build --network host -t $IMAGE_NAME:$IMAGE_TAG .

if [ $? -eq 0 ]; then
    log "32" "Build successful! 🚀"
    echo "Run the following command to start the container (make sure to use flags you need when running for example -p 1234:1234):"
    echo "docker run -d $IMAGE_NAME:$IMAGE_TAG "
else
    log "31" "Build failed! ❌"
fi
