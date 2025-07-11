# Allow SSH
aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$SECURITY_GROUP_ID" \
  --protocol tcp --port 22 --cidr 0.0.0.0/0
