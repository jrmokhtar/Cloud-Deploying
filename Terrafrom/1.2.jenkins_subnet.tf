resource "aws_subnet" "pubadmin_subnet" {
  vpc_id     = aws_vpc.admin_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubadmin_subnet"
  }
}



