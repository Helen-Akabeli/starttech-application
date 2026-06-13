#!/bin/bash

set -e

echo "Installing dependencies..."

npm install

echo "Building frontend..."

npm run build

echo "Uploading to S3..."

aws s3 sync dist/ s3://$AWS_S3_BUCKET --delete

echo "Invalidating CloudFront cache..."

aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_DISTRIBUTION \
  --paths "/*"

echo "Frontend deployment completed."