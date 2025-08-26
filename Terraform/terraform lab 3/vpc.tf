resource "aws_vpc" "creating_VPC" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}_VPC"
  }
}

resource "aws_internet_gateway" "creating_IGW" {
  vpc_id = aws_vpc.creating_VPC.id

  tags = {
    Name = "${var.project_name}_IGW"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.creating_VPC.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}_PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.creating_VPC.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}_PublicSubnet2"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.creating_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.creating_IGW.id
  }

  tags = {
    Name = "${var.project_name}_RouteTable"
  }
}

resource "aws_route_table_association" "association_of_subnet1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "association_of_subnet2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route_table.id
}