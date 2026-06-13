#!/bin/bash

URL=${1:-http://localhost:8080/health}

echo "Checking application health..."

curl -f $URL

if [ $? -eq 0 ]; then
    echo "Application is healthy."
else
    echo "Application health check failed."
    exit 1
fi