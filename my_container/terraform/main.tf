module "network_layer" {
  #description = "This layer is going to create all the network layers"
  source        = "./vpc_subnet"
  my_laptops_ip = ["192.168.43.139/32"]
}

/*
module "aws_instnce_private" {
  source = "./instance_module"
  #description     = "This layer is going to launch Instances in app layer"
  instance_subnet = module.network_layer.snehil-private-subnet-id
  instance_name   = "snehil-private-instance"
}
*/
module "aws_instnce_public" {
  source = "./instance_module"
  #description     = "This layer is going to launch Instances in app layer"
  instance_subnet         = module.network_layer.snehil-public-subnet-id
  instance_name           = "snehil-public-instance"
  instance_security_group = ["${module.network_layer.snehil-instance-security-group-id}"]
}
