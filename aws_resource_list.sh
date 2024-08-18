#!/bin/bash

#############################################################
# Author: Manoj Bharadwaja Thota
# Version: 0.0.1version
# Date: 2024-08-18
#
# Description: Script to automate the process of listing all the resources in AWS account
# Below are the list of resources supported by this script
# 1. EC2
# 2. RDS
# 3. S3
# 4. Cloud front
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# This script will prompt the user to enter AWS region and service for which resources need to be listed.
#
# Usage: ./aws_resource_list.sh us-east-1 <region> <service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################

# Check if the required number of arguments are passed
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <region> <service>"
  exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed. Please install it before running this script."
  exit 1
fi

# Check if the AWS CLI configured or not
if ! aws configure list &> /dev/null; then
  echo "AWS CLI is not configured. Please configure it before running this script."
  exit 1
fi

# Execute the AWS CLI command based on service name
case "$2" in
  ec2)
    aws ec2 describe-instances --region "$1"
    ;;
  s3)
   aws s3api list-buckets --region "$1"
   ;;
  rds)
   aws rds describe-db-instances --region "$1"
   ;;
  cloudfront)
   aws cloudfront list-distributions --region "$1"
   ;;
  vpc)
   aws ec2 describe-vpcs --region "$1"
   ;;
   iam)
   aws iam list-users --region "$1"
   ;;
   route53)
   aws route53 list-hosted-zones --region "$1"
   ;;
   cloudwatch)
   aws cloudwatch list-metrics --region "$1"
   ;;
   cloudformation)
   aws cloudformation list-stacks --region "$1"
   ;;
   lambda)
   aws lambda list-functions --region "$1"
   ;;
   sns)
   aws sns list-topics --region "$1"
   ;;
   sqs)
   aws sqs list-queues --region "$1"
   ;;
   dynamodb)
   aws dynamodb list-tables --region "$1"
   ;;
   ebs)
   aws ec2 describe-volumes --region "$1"
   ;;
   *)
   echo "Unsupported service: $2"
   exit 1
   ;;
esac
