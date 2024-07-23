# Terraform
Terraform with AWS

##ec2
Create EC2 instance with terraform

##vpc
Create VPC, two subnets, an internet gateway, and two EC2 instances with terraform.

##vpc_with_subnets_and_nat
Building AWS infrastructure with Terraform, including a VPC, two subnets (Public and Private), internet access, and EC2 instances. We’ll create public and private subnets and configure a NAT Gateway for secure outbound internet access. EC2 instance in public subnet has direct internet access and outsiders can access public subnet from the internet. EC2 instance in the private subnet can access the internet through a NAT gateway. It has limited access. We have created Security Groups to manage inbound and outbound traffic.
