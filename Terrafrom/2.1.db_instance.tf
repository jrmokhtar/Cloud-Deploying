resource "aws_db_instance" "RDS_instance" {
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_id]
  availability_zone      = var.availability_zone
  
  db_name            = "rds"
  license_model      = "general-public-license"
  identifier         = "dhangodb"
  
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0.35"
  instance_class     = "db.t3.micro"
  publicly_accessible = true
  skip_final_snapshot = true
  
  username           = var.username
  password           = var.password
  
  multi_az           = false
}
