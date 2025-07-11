#!/bin/bash

# Generate a random bucket name
BUCKET_NAME="mybucket-$(date +%s)-$RANDOM"
REGION="${REGION:-$(aws configure get region)}"
SCRIPT_FILE="setup.sh"

# Create bucket
aws s3api create-bucket \
  --bucket "$BUCKET_NAME" \
  --region "$REGION" \
  --create-bucket-configuration LocationConstraint="$REGION"

echo "Bucket created: $BUCKET_NAME"

# Upload a file
aws s3 cp "$SCRIPT_FILE" "s3://$BUCKET_NAME/"

# List contents
echo "Contents of the bucket:"
aws s3 ls "s3://$BUCKET_NAME/"

# Delete the bucket
aws s3 rb "s3://$BUCKET_NAME" --force
echo "Bucket $BUCKET_NAME deleted."

