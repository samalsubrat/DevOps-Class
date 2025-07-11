#!/bin/bash

REGION="${REGION:-$(aws configure get region)}"
KEY_NAME="my-key"
KEY_FILE="$KEY_NAME.pem"
SG_NAME="my-sg"
INSTANCE_TYPE="t2.micro"
SCRIPT_FILE="remote_s3.sh"

# Create Key Pair
aws ec2 create-key-pair --region "$REGION" --key-name "$KEY_NAME" --query 'KeyMaterial' --output text > "$KEY_FILE"
chmod 400 "$KEY_FILE"

# Create SG
SG_ID=$(aws ec2 create-security-group --region "$REGION" --group-name "$SG_NAME" --description "SG for EC2" --query 'GroupId' --output text)
aws ec2 authorize-security-group-ingress --region "$REGION" --group-id "$SG_ID" --protocol tcp --port 22 --cidr 0.0.0.0/0

# Get AMI
AMI_ID=$(aws ec2 describe-images \
  --region "$REGION" \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" \
  --query 'Images[*].[ImageId,CreationDate]' \
  --output text | sort -k2 -r | head -n1 | awk '{print $1}')

# Launch EC2
INSTANCE_ID=$(aws ec2 run-instances \
  --region "$REGION" \
  --image-id "$AMI_ID" \
  --count 1 \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SG_ID" \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Instance launched: $INSTANCE_ID"

aws ec2 wait instance-running --region "$REGION" --instance-ids "$INSTANCE_ID"

# Get DNS
PUBLIC_DNS=$(aws ec2 describe-instances \
  --region "$REGION" \
  --instance-ids "$INSTANCE_ID" \
  --query 'Reservations[0].Instances[0].PublicDnsName' \
  --output text)

echo "Public DNS: $PUBLIC_DNS"

# Copy script
scp -i "$KEY_FILE" "$SCRIPT_FILE" ubuntu@"$PUBLIC_DNS":~

# SSH and run
ssh -o StrictHostKeyChecking=no -i "$KEY_FILE" ubuntu@"$PUBLIC_DNS" 'bash remote_s3.sh'

