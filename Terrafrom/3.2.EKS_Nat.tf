resource "aws_eip" "nat_eip" {
}
resource "aws_eip" "nat_eip_2" {
}
#############################################
resource "aws_nat_gateway" "nat_gateway3" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.EKS_1thprivate.id
  depends_on = [aws_internet_gateway.vpc_igw]
}
resource "aws_nat_gateway" "nat_gateway_4" {
  allocation_id = aws_eip.nat_eip_2.id
  subnet_id     = aws_subnet.EKS_2thprivate.id
}