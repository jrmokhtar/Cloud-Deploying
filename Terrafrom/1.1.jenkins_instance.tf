data "aws_ami" "admin_ami" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/*/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "jenkins_ec2" {
  ami           = data.aws_ami.admin_ami.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pubadmin_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_secgroup.id]
  key_name = "admin"

  tags = {
    Name = "Jenkins EC2"
  }
}