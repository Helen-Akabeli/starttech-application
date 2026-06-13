#!/bin/bash

PREVIOUS_TAG=$1

if [ -z "$PREVIOUS_TAG" ]; then
    echo "Usage: rollback.sh <image-tag>"
    exit 1
fi

docker pull $ECR_REPOSITORY:$PREVIOUS_TAG

docker stop backend || true
docker rm backend || true

docker run -d \
  --name backend \
  -p 8080:8080 \
  $ECR_REPOSITORY:$PREVIOUS_TAG

echo "Rollback completed."