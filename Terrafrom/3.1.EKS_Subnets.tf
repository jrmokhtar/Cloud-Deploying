resource "aws_subnet" "EKS_1thprivate" {
  vpc_id            = aws_vpc.admin_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name"                            = "1thprivate"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}
#####################################################
resource "aws_subnet" "EKS_2thprivate" {
  vpc_id            = aws_vpc.admin_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    "Name"                            = "2thprivate"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}
########################################################
resource "aws_subnet" "EKS_1thpub" {
  vpc_id                  = aws_vpc.admin_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "1thpub"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
#########################################################
resource "aws_subnet" "EKS_2thpub" {
  vpc_id                  = aws_vpc.admin_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "2thpub"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
