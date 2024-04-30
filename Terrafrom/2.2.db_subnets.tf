# data "aws_availability_zones" "AZs" {}

# resource "aws_subnet" "db_1thsubnet" {
#   vpc_id            = aws_vpc.admin_vpc.id
#   cidr_block        = "10.0.11.0/24"
#   availability_zone = data.aws_availability_zones.AZs.names[0] 
# }

# resource "aws_subnet" "db_2thsubnet" {
#   vpc_id            = aws_vpc.admin_vpc.id
#   cidr_block        = "10.0.12.0/24" 
#   availability_zone = data.aws_availability_zones.AZs.names[1]
# }

# resource "aws_db_subnet_group" "RDS_subnets" {
#   name = "rds_subnets"
#   subnet_ids = [aws_subnet.db_1thsubnet.id, aws_subnet.db_2thsubnet.id ]
# }