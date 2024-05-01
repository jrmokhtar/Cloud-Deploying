resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = var.vpc_id
}
