#!/bin/bash

set -e

echo "Building Docker image..."

docker build -t starttech-backend .

echo "Tagging image..."

docker tag starttech-backend:latest $ECR_REPOSITORY:latest

echo "Pushing image to ECR..."

docker push $ECR_REPOSITORY:latest

echo "Backend deployment package created successfully."