resource "aws_vpc" "admin_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.vpc_tags
}
