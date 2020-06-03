
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "snehil-vpc" {
  count            = var.no_of_vpc
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "snehil-vpc"
  }
}

resource "aws_subnet" "snehil-public-subnet" {
  count                   = var.no_of_vpc
  cidr_block              = var.public_subnet_cidr
  vpc_id                  = aws_vpc.snehil-vpc[count.index].id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = "true"
  tags = {
    Name = "snehil-${data.aws_availability_zones.available.names[count.index]}-${var.public_subnet_cidr}-public-subnet"
  }
}

resource "aws_subnet" "snehil-private-subnet" {
  count             = var.no_of_vpc
  cidr_block        = var.private_subnet_cidr
  vpc_id            = aws_vpc.snehil-vpc[count.index].id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "snehil-${data.aws_availability_zones.available.names[count.index]}-${var.private_subnet_cidr}-private-subnet"
  }
}

resource "aws_internet_gateway" "snehil-internet-gateway" {
  vpc_id = aws_vpc.snehil-vpc[0].id
  tags = {
    Name = "snehil-internet-gateway"
  }
}

resource "aws_route_table" "snehil-public-route-table" {
  vpc_id = aws_vpc.snehil-vpc[0].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.snehil-internet-gateway.id
  }
  tags = {
    Name = "snehil-public-route-table"
  }
  depends_on = [aws_internet_gateway.snehil-internet-gateway]
}

resource "aws_route_table_association" "snehil-route-table-association" {
  subnet_id      = aws_subnet.snehil-public-subnet[0].id
  route_table_id = aws_route_table.snehil-public-route-table.id
  depends_on     = [aws_route_table.snehil-public-route-table]
}

resource "aws_security_group" "snehil-instance-security-group" {
  name   = "snehil-instance-security-sg"
  vpc_id = aws_vpc.snehil-vpc[0].id
  ingress {
    description = "Allow 22 port for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.my_laptops_ip
  }
  ingress {
    description = "Allow 80 port for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.my_laptops_ip
  }
  ingress {
    description = "Allow 80 port for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.my_laptops_ip
  }
  ingress {
    description = "Allow 22 port for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 80 port for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 80 port for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
