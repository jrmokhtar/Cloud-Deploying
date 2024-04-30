resource "aws_security_group" "elb_sg" {
  name   = "alb-security-group"
  vpc_id = aws_vpc.admin_vpc.id  

  # Inbound rules to allow HTTP/HTTPS traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere
  }

  # Outbound rules for backend communication
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "ELB Security Group"
  }
}

