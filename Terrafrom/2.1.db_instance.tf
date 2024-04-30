 resource "aws_db_instance" "RDS_instance" {
 
db_subnet_group_name = aws_db_subnet_group.RDS_subnets.name
   vpc_security_group_ids = [aws_security_group.RDS_secgroup.id]
   availability_zone = data.aws_availability_zones.AZs.names[0]
  
   db_name = "rds"
   license_model = "general-public-license"
   identifier = "dhangodb"

   allocated_storage    = 20
   engine              = "mysql"
   engine_version      = "8.0.35"
   instance_class      = "db.t3.micro"
   publicly_accessible = true
   skip_final_snapshot = true

   username            = "your_username"
   password            = "your_password"
  
   multi_az = false

 }
