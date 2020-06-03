output "instance_name" {
  description = "this will be Instance name"
  value       = var.instance_name
}

output "instance_vpc_id" {
  description = "VPC where you are going to launch instance"
  value       = var.instance_vpc_id
}

output "instance_subnet" {
  description = "Subnet where you are going to launch your instance"
  value       = var.instance_subnet
}

output "instance_key" {
  description = "Key that you are going to use to login into your instance"
  value       = var.instance_key
}

output "instance_type" {
  description = "Type of Instance you want to launch"
  value       = var.instance_type
}

output "instance_ami" {
  description = "Image id"
  value       = var.instance_ami
}

output "instance-id" {
  value = aws_instance.snehil-instance.id
}

output "instance-url-to-hit" {
  value = "http://${aws_instance.snehil-instance.public_dns}/hello.html"
}
