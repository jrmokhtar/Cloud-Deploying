resource "aws_ecr_repository" "ECR" {
  name                 = "ecr-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push         = true
  }
  tags = {
    name= "Docker_repo"
  }
  
}