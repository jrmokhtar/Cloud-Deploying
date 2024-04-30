resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.admin_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}
############################################################################
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.pubadmin_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.EKS_1thpub.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet_association_3" {
  subnet_id      = aws_subnet.EKS_2thpub.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.EKS_1thprivate.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private_route_association_2" {
  subnet_id      = aws_subnet.EKS_2thprivate.id
  route_table_id = aws_route_table.public_rt.id
}
