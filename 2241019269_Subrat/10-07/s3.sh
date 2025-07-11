#!/bin/bash

# Variables
REGION="${REGION:-$(aws configure get region)}"
BUCKET_NAME="website-bucket-$(date +%s)-$RANDOM"
INDEX_FILE="index.html"
ERROR_FILE="error.html"

echo "Creating S3 bucket: $BUCKET_NAME"
aws s3api create-bucket \
  --bucket "$BUCKET_NAME" \
  --region "$REGION" \
  --create-bucket-configuration LocationConstraint="$REGION"

# Unblock public access
echo "Unblocking public access for $BUCKET_NAME"
aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration \
  'BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false'

# Enable static website hosting
echo "Configuring static website hosting"
aws s3 website s3://"$BUCKET_NAME"/ \
  --index-document index.html \
  --error-document error.html

# Upload HTML files without ACL (recommended)
echo "⬆️ Uploading website files"
aws s3 cp "$INDEX_FILE" s3://"$BUCKET_NAME"/index.html
aws s3 cp "$ERROR_FILE" s3://"$BUCKET_NAME"/error.html

# Create a temporary bucket policy
cat <<EOF > policy.json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "PublicReadGetObject",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
  }]
}
EOF

# Apply bucket policy
echo "Applying public-read bucket policy"
aws s3api put-bucket-policy \
  --bucket "$BUCKET_NAME" \
  --policy file://policy.json

# Website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
echo "Website hosted at: $WEBSITE_URL"

# Show REST-style object URL
OBJECT_URL="https://$BUCKET_NAME.s3.$REGION.amazonaws.com/index.html"
echo "Public object URL (REST): $OBJECT_URL"

# Test via curl
echo "Testing site with curl..."
curl --silent "$WEBSITE_URL"

# Clean up
rm policy.json

