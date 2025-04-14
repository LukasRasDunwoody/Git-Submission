output "vpc_id" {
  description = "id of the VPC"
  value = "${aws_vpc.main_infra_vpc.id}"
}

output "subnet_availability_zones_1" {
  description = "Availability Zones of the Subnets"
  value = "${aws_subnet.public_subnet_1.availability_zone}"
}

output "subnet_availability_zones_2" {
  description = "Availability Zones of the Subnets"
  value = "${aws_subnet.public_subnet_2.availability_zone}"
}

output "ec2_ip_addresses_1" {
  description = "Public IP addresses of the EC2 Instances"
  value = "${aws_instance.infra_ec2_instance_public_subnet_1.id}" 
}

output "ec2_ip_addresses_2" {
  description = "Public IP addresses of the EC2 Instances"
  value = "${aws_instance.infra_ec2_instance_public_subnet_2.id}" 
}

