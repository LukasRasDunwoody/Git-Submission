variable "backend-aws-s3-name" {
  description = "AWS S3 name for terraform backend"
  type = string
  default = "terraform-state-lras"
}

variable "backend-s3-bucket-key" {
  description = "S3 bucket key for terraform backend"
  type = string
  default = "global/s3/terraform.tfstate"
}

variable "backend-dynamodb-table" {
  description = "DynamoDB tablename for terraform backend"
  type = string
  default = "terraform-lock-lras"
}

variable "backend-aws-region" {
  description = "AWS Region for terraform backend"
  type = string
  default = "us-east-1"
}

variable "vpc-cidr-block" {
    description = "cidr Block of the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc-subnet-cidr-block_1" {
  description = "public subnet CIDR blocks"
  type = string
  default = "10.0.1.0/24"
}

variable "vpc-subnet-cidr-block_2" {
  description = "public subnet CIDR blocks"
  type = string
  default = "10.0.2.0/24"
}

variable "infra-aws-region" {
  description = "AWS Region for terraform backend"
  type = string
  default = "us-east-1"
}

variable "infra_ec2_ami" {
  description = "amis for the ec2 instances on the subnets"
  type = string
  default = "ami-0230bd60aa48260c6" # Amazon Linux 2023 AMI in us-east-1
}

variable "infra_ec2_instance_type" {
  description = "the type of instance"
  type = string
  default = "t3.micro"
}

variable "infra-aws-region-public-subnet-1" {
  description = "the region of the public subnet 1"
  type = string
  default = "us-east-1a"
}
variable "infra-aws-region-public-subnet-2" {
  description = "the region of the public subnet 2"
  type = string
  default = "us-east-1b"
}