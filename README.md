# Shell Scripting Repo

This is my personal repo for shell scripts.  
Right now it has a script called **aws_resource_list.sh** which helps you list resources in your AWS account.  

## How to use

Run the script like this:

```bash
./aws_resource_list.sh <region> <service>
```

Example:

```bash
./aws_resource_list.sh us-east-1 ec2
```

Supported services:
- EC2
- RDS
- S3
- CloudFront
- VPC
- IAM
- Route53
- CloudWatch
- CloudFormation
- Lambda
- SNS
- SQS
- DynamoDB
- EBS

Just make sure you have AWS CLI installed and configured before running the script.

That's it! 👍
