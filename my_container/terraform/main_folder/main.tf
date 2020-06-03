module "network_layer" {
  #description = "This layer is going to create all the network layers"
  source      = "../vpc_subnet"
}

module "aws_instnce_private" {
  source = "/Users/snehilmaheshwari/my_container/terraform/aws_instnce/modules/instance_module"
  #description     = "This layer is going to launch Instances in app layer"
  instance_subnet = module.network_layer.snehil-private-subnet.id
  instance_name   = "snehil-private-instance"
}

module "aws_instnce_public" {
  source = "/Users/snehilmaheshwari/my_container/terraform/aws_instnce/modules/instance_module"
  #description     = "This layer is going to launch Instances in app layer"
  instance_subnet = module.network_layer.snehil-public-subnet.id
  instance_name   = "snehil-public-instance"
}
