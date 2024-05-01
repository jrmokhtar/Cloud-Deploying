 data "aws_availability_zones" "AZs" {}
############################################################################
resource "aws_subnet" "db_1thsubnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = data.aws_availability_zones.AZs.names[var.availability_zone_index]
}
############################################################################
resource "aws_subnet" "db_2thsubnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = data.aws_availability_zones.AZs.names[var.availability_zone_index]
}
############################################################################
 resource "aws_db_subnet_group" "RDS_subnets" {
   name = "rds_subnets"
   subnet_ids = [aws_subnet.db_1thsubnet.id, aws_subnet.db_2thsubnet.id ]
 }
