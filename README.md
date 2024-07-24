# Terraform
Terraform with AWS

### ec2  
Create EC2 instance with terraform

### vpc  
Create VPC, two subnets, an internet gateway, and two EC2 instances with terraform.

### vpc_with_subnets_and_nat  
Building AWS infrastructure with Terraform, including a VPC, two subnets (Public and Private), internet access, and EC2 instances. We’ll create public and private subnets and configure a NAT Gateway for secure outbound internet access. EC2 instance in public subnet has direct internet access and outsiders can access public subnet from the internet. EC2 instance in the private subnet can access the internet through a NAT gateway. It has limited access. We have created Security Groups to manage inbound and outbound traffic.

### s3_bucket
Create AWS s3 bucket with terraform.
Then Enabled the versioning.
* * Versioning in Amazon S3 is a means of keeping multiple variants of an object in the same bucket. You can use the S3 Versioning feature to preserve, retrieve, and restore every version of every object stored in your buckets. With versioning you can recover more easily from both unintended user actions and application failures. After versioning is enabled for a bucket, if Amazon S3 receives multiple write requests for the same object simultaneously, it stores all of those objects.
