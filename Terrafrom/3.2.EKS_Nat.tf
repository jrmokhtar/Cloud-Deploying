resource "aws_eip" "nat_eip" {
}
resource "aws_eip" "nat_eip_2" {
}
#############################################
resource "aws_nat_gateway" "nat_gateway3" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id_1
  depends_on    = [aws_internet_gateway.vpc_igw]
}

resource "aws_nat_gateway" "nat_gateway_4" {
  allocation_id = var.allocation_id_2
  subnet_id     = var.subnet_id_2
}
