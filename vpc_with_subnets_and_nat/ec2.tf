#Create Security Groups
resource "aws_security_group" "security_group" {
    description = "Allow limited inbound External Traffic"
    vpc_id = "${aws_vpc.demo_vpc.id}"
    name = "terraform_ec2_private_sg"

    ingress {
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
    }

    ingress {
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 8080
        to_port = 8080
    }

    ingress {
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 443
        to_port = 443
    }

    egress {
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
    }
}

output "aws_security_gr_id" {
  value = "${aws_security_group.security_group.id}"
}

#Create EC2 Instance in Public Subnet
resource "aws_instance" "Public_Instance" {
  ami = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.security_group.id}" ]
  subnet_id = "${aws_subnet.Public_Subnet.id}"
  key_name = "MyTestKeyPairr"
  count = 1
  associate_public_ip_address = "true"
  
  tags = {
    Name = "public instance"
  }
}


#Create EC2 Instance in Private Subnet
resource "aws_instance" "Private_Instance" {
  ami = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.security_group.id}" ]
  subnet_id = "${aws_subnet.Private_Subnet.id}"
  key_name = "MyTestKeyPairr"
  count = 1
  associate_public_ip_address = "false"
  
  tags = {
    Name = "private instance"
  }
}



