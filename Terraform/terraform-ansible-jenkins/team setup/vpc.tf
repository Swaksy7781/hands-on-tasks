#VPC
resource "aws_vpc" "team_VPC" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}_VPC"
  }
}

#IGW
resource "aws_internet_gateway" "team_IGW" {
  vpc_id = aws_vpc.team_VPC.id

  tags = {
    Name = "${var.project_name}_IGW"
  }
}

#Subnet
resource "aws_subnet" "team_subnet" {
  vpc_id                  = aws_vpc.team_VPC.id
  cidr_block              = var.team_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}_Subnet"
  }
}

#routetable
resource "aws_route_table" "team_route_table" {
  vpc_id = aws_vpc.team_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.team_IGW.id
  }

  tags = {
    Name = "${var.project_name}_RouteTable"
  }
}

#association of routetable to subnet
resource "aws_route_table_association" "association_of_subnet" {
  subnet_id      = aws_subnet.team_subnet.id
  route_table_id = aws_route_table.team_route_table.id
}
