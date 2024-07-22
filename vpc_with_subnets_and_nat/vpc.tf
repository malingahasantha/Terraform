#Creating VPC, CIDR, Name tags
resource "aws_vpc" "demo_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "demo_vpc vpc"
    }
}

#Creating Public Subnet with Default Route to Internet
resource "aws_subnet" "Public_Subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.0.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1a"

    tags = {
        Name = "Public Subnet"
    }
}

#Creating Private Subnet with Default Route to NAT Gateway
resource "aws_subnet" "Private_Subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.1.0/24"
        map_public_ip_on_launch = "false"
        availability_zone = "ap-south-1a"

    tags = {
        Name = "Private Subnet"
    }
}

#Creating Internet Gateway for VPC
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.demo_vpc.id

    tags = {
        Name = "demo_vpc IGW"
    }
}


#Route Tables for Public Subnet
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.demo_vpc.id

    route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Public Route Table" 
    }
}

#Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.Public_Subnet.id
    route_table_id = aws_route_table.public_rt.id
}
