#!/bin/bash

BUCKET_NAME="remote-bucket-$(date +%s)-$RANDOM"
REGION="us-east-1"

# Create S3 bucket
aws s3api create-bucket --region "$REGION" --bucket "$BUCKET_NAME"

# Create access point
AP_NAME="ap-${BUCKET_NAME:0:15}"

aws s3control create-access-point \
  --region "$REGION" \
  --account-id "$(aws sts get-caller-identity --query Account --output text)" \
  --name "$AP_NAME" \
  --bucket "$BUCKET_NAME"

echo "✅ Created bucket $BUCKET_NAME and access point $AP_NAME"

