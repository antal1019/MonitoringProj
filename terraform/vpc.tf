resource "aws_vpc" "vpc-project" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Project"
  }
}

resource "aws_subnet" "subnet-pub-1" {
  vpc_id                  = aws_vpc.vpc-project.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "subnet-pub-2" {
  vpc_id                  = aws_vpc.vpc-project.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-project.id
  tags = {
    Name = "Project-IGW"
  }
}



resource "aws_route_table" "RT-pub" {
  vpc_id = aws_vpc.vpc-project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "rt-assoc-pub-1" {
  subnet_id      = aws_subnet.subnet-pub-1.id
  route_table_id = aws_route_table.RT-pub.id
}

resource "aws_route_table_association" "rt-assoc-pub-2" {
  subnet_id      = aws_subnet.subnet-pub-2.id
  route_table_id = aws_route_table.RT-pub.id
}



