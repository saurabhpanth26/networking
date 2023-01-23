output "my_vpc" {
   value = aws_vpc.main-vpc.id
}


output "my_subnet" {
   value = aws_subnet.main-subnet.id
}


output "my-igw" {
     value = aws_internet_gateway.igw.id
}


output "my-route-table" {
   value = aws_route_table.my-route-table.id
}


output "my-route-table-association" {
   value = aws_route_table_association.my-route-table-association.id
}




