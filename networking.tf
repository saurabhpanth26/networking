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



