variable "vpc_cidr" {
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

variable "no_of_vpc" {
  description = "How many vpcs you need"
  default     = "1"
}

variable "public_subnet_cidr" {
  description = "subnet cidr that we are going to use for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "subnet cidr that we are going to use for our private subnet"
  default     = "10.0.2.0/24"
}

variable "my_laptops_ip" {
  type        = list
  description = "just run ipconfig on your system and provide ip from where you want to access it"
}
