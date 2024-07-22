#Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
    domain = "vpc"
    depends_on = [ aws_internet_gateway.igw ]

    tags = {
        Name = "NAT Gateway EIP"
    }
}

#Create NAT Gateway for VPC
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.Public_Subnet.id

    tags = {
        Name = "NAT Gateway"
    }
}

#Create Private Route Table
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.demo_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "Private Route Table"
    }   
}

#Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_rt_association" {
    subnet_id = aws_subnet.Private_Subnet.id
    route_table_id = aws_route_table.private_rt.id
}
