output "vpc_cidr" {
  description = "VPC cidr block"
  value       = var.vpc_cidr
}

output "no_of_vpc" {
  description = "How many vpcs you need"
  value       = var.no_of_vpc
}

output "public_subnet_cidr" {
  description = "subnet cidr that we are going to use for public subnet"
  value       = var.public_subnet_cidr
}

output "private_subnet_cidr" {
  description = "subnet cidr that we are going to use for our private subnet"
  value       = var.private_subnet_cidr
}

output "snehil-vpc-id" {
  value = aws_vpc.snehil-vpc[0].id
}

output "snehil-public-subnet-id" {
  value = aws_subnet.snehil-public-subnet[0].id
}

output "snehil-private-subnet-id" {
  value = aws_subnet.snehil-private-subnet[0].id
}

output "snehil-instance-security-group-id" {
  value = aws_security_group.snehil-instance-security-group.id
}
