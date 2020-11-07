resource "aws_subnet" "pub_subnet" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.83.16.0/20"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
}