#!/bin/bash

BUCKET_NAME="your-existing-bucket-name"

# Make the bucket public read-only (example policy)
aws s3api put-bucket-acl --bucket "$BUCKET_NAME" --acl public-read

echo "Access control policy modified for bucket: $BUCKET_NAME"

