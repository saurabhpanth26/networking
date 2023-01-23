resource "aws_vpc" "main-vpc" {
   cidr_block = var.vpc_cidr_block
   enable_dns_hostnames = "true"
   tags = {
       Name = "john.07-vpc"
    }
}



resource "aws_subnet" "main-subnet" {
   vpc_id     = aws_vpc.main-vpc.id
   cidr_block = var.subnet-1_cidr_block

   tags = {
       Name = var.subnet_name
   }
}


resource "aws_internet_gateway" "igw" {
     vpc_id = aws_vpc.main-vpc.id

    tags = {
       Name = var.igw_name
    }
}


resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}


resource "aws_route_table_association" "my-route-table-association" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}



