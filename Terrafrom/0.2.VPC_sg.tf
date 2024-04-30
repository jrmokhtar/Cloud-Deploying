resource "aws_security_group" "ec2_secgroup" {
  name        = "ec2_secgroup"
  description = "Access port 8080 and 22"
  vpc_id      = aws_vpc.admin_vpc.id

  tags = {
    Name = "admin security group"
  }

  ingress {
    description = "HTTP proxy access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from any IP address
  }

  ingress {
   description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH traffic from any IP address
  }


  egress {
    description = "allow all outbound access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

}

