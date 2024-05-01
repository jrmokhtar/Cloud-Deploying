resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "Public Route Table"
  }
}

############################################################################
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = var.route_table_id
}

