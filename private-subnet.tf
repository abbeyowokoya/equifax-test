resource "aws_subnet" "prod-subnet-private-1" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.20.0/21"
    map_public_ip_on_launch = "false" //it makes this a private subnet
    availability_zone = "us-east-1a"

    tags = {
        Name = "prod-subnet-private-1"
    }
}

resource "aws_subnet" "prod-subnet-private-2" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.30.0/21"
    map_public_ip_on_launch = "false" //it makes this a private subnet
    availability_zone = "us-east-1b"

    tags = {
        Name = "prod-subnet-private-2"
    }
}
