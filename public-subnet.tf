# data "aws_availability_zones" "available" {}

resource "aws_subnet" "prod-subnet-public-1" {
    # count = "${length(data.aws_availability_zones.available.names)}"
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.1.0/21"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-1a"

    tags = {
        Name = "prod-subnet-public-1"
    }
}

resource "aws_subnet" "prod-subnet-public-2" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.10.0/21"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-1b"
    
    tags = {
        Name = "prod-subnet-public-2"
    }
}