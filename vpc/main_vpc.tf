provider "aws"{
    region="ap-south-1"
}

#creating vpc, name, cidr and tags
resource "aws_vpc" "test_terra_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
      Name = "test_terra_vpc"
    }
}

#creating two public subnets in vpc
resource "aws_subnet" "test_terra_public_1" {
    vpc_id = aws_vpc.test_terra_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"

    tags = {
      Name = "test_terra_public_1"
    }
  
}

resource "aws_subnet" "test_terra_public_2" {
    vpc_id = aws_vpc.test_terra_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1b"

    tags = {
        Name = "test_terra_public_2"
    }  
}

#creating internet gateway in aws vpc
resource "aws_internet_gateway" "test_terra_gw" {
    vpc_id = aws_vpc.test_terra_vpc.id

    tags = {
      Name = "test_terra_gw"
    }
}

#creating route tables for internet gateway
resource "aws_route_table" "test_terra_rt" {
    vpc_id = aws_vpc.test_terra_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test_terra_gw.id
    }  

    tags = {
      Name = "test_terra_public_1"
    }
}

#creating route associations public subnet
resource "aws_route_table_association" "test_terra_public_1-a" {
    subnet_id = aws_subnet.test_terra_public_1.id
    route_table_id = aws_route_table.test_terra_rt.id
}

resource "aws_route_table_association" "test_terra_public_2-a" {
    subnet_id = aws_subnet.test_terra_public_2.id
    route_table_id = aws_route_table.test_terra_rt.id
}

#creating ec2 instances in public subnet
resource "aws_instance" "test_terra_inst_1" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.test_terra_public_1.id}"
    key_name = "MyTestKeyPairr"

    tags = {
      Name = "test_terra_inst_1"
    }
}

resource "aws_instance" "test_terra_inst_2" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.test_terra_public_2.id}"
    key_name = "MyTestKeyPairr"

    tags = {
      Name = "test_terra_inst_2"
    }
}