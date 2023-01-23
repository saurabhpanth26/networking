resource "aws_vpc" "main-vpc" {
   cidr_block = "10.100.0.0/16"
   enable_dns_hostnames = "true"
   tags = {
       Name = "john.07-vpc"
    }
}



resource "aws_subnet" "main-subnet" {
   vpc_id     = aws_vpc.main-vpc.id
   cidr_block = "10.100.0.0/24"

   tags = {
       Name = "john.07-subnet1"
   }
}


resource "aws_internet_gateway" "igw" {
     vpc_id = aws_vpc.main-vpc.id

    tags = {
       Name = "john.07-igw"
    }
}


resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "john.07-route-table"
  }
}


resource "aws_route_table_association" "my-route-table-association" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.my-route-table.id
}



