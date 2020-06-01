resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.prod-vpc.id
    tags = {
        Name = "prod-igw"
    }
}


resource "aws_route_table" "prod-rt" {
  vpc_id = aws_vpc.prod-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.prod-subnet-private-1.id
  route_table_id = aws_route_table.prod-rt.id
}
