provider "aws" {
  region = "${var.infra-aws-region}"
}

# create a vpc to host our application and infrastructure
resource "aws_vpc" "main_infra_vpc" {
  cidr_block = "${var.vpc-cidr-block}"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name   = "VPC_Infra-Prod"
  }
}

# 1st public subnet for vpc
resource "aws_subnet" "public_subnet_1" {
  vpc_id = "${aws_vpc.main_infra_vpc.id}"
  cidr_block = "${var.vpc-subnet-cidr-block_1}"
  availability_zone = "${var.infra-aws-region-public-subnet-1}"
  tags = {
    Name = "VPC_Infra-Prod_Public_Subnet_1"
  }
}

# 2nd publoc subnet for vpc
resource "aws_subnet" "public_subnet_2" {
  vpc_id = "${aws_vpc.main_infra_vpc.id}"
  cidr_block = "${var.vpc-subnet-cidr-block_2}"
  availability_zone = "${var.infra-aws-region-public-subnet-2}"
  tags = {
    Name = "VPC_Infra-Prod_Public_Subnet_2"
  }
}

# make a security group for a vpc
resource "aws_security_group" "vpc_security_group" {
  name = "VPC_Infra-Prod_Security_Group_lras"
  description = "VPC_Infra-Prod_Security_Group"
  vpc_id = "${aws_vpc.main_infra_vpc.id}"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "VPC_Infra-Prod_Security_Group"
  }
}

# subnet 1
resource "aws_instance" "infra_ec2_instance_public_subnet_1" {
  ami = "${var.infra_ec2_ami}"
  instance_type = "${var.infra_ec2_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.vpc_security_group.id}"]
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  associate_public_ip_address = true
  tags = {
    Name = "VPC_Infra-Prod_EC2_Instance_lras_subnet_1"
  }
}

# subnet 2
resource "aws_instance" "infra_ec2_instance_public_subnet_2" {
  ami = "${var.infra_ec2_ami}"
  instance_type = "${var.infra_ec2_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.vpc_security_group.id}"]
  subnet_id = "${aws_subnet.public_subnet_2.id}"
  associate_public_ip_address = true
  tags = {
    Name = "VPC_Infra-Prod_EC2_Instance_lras_subnet_2"
  }
}

