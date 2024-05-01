resource "aws_s3_bucket" "lblogs" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "lblogs" {
  bucket = aws_s3_bucket.lblogs.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lblogs" {
  bucket = aws_s3_bucket.lblogs.id

  rule {
    id     = "expire-logs"
    status = "Enabled"

    expiration {
      days = var.lifecycle_days
    }
  }
}

####################################################################

resource "aws_lb" "elb" {
  name               = var.alb_name
  load_balancer_type = "application"

  access_logs {
    bucket = var.log_bucket_id
    prefix = var.log_prefix
  }

  subnets            = var.alb_subnets
  security_groups    = var.alb_security_groups

  tags = {
    Name = "elb"
  }
}
