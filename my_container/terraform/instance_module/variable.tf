variable "instance_name" {
  description = "this will be Instance name"
  default     = "instance-1"
}

variable "instance_vpc_id" {
  description = "VPC where you are going to launch instance"
  default     = "vpc-85d9caff"
}

variable "instance_subnet" {
  description = "Subnet where you are going to launch your instance"
  default     = "subnet-07c0564a"
}

variable "instance_key" {
  description = "Key that you are going to use to login into your instance"
  default     = "snehil-instance-key"
}

variable "instance_type" {
  description = "Type of Instance you want to launch"
  default     = "t2.micro"
}

variable "instance_ami" {
  description = "Image id"
  default     = "ami-0323c3dd2da7fb37d"
}

variable "instance_security_group" {
  type        = list
  description = "security group to be used for instance"
  default     = ["sg-4dc2bb6e"]
}
variable "bootstrap_script" {
  description = "This is the script which we are going to run as part of bootstrap"
  default     = "./scripts/startup.sh"
}
