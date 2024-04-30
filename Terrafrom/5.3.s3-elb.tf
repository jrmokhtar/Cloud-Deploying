resource "aws_s3_bucket" "lblogs" {
  bucket = "nader-logs"
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
      days = 30 
    }
  }
}
####################################################################

resource "aws_lb" "elb" {
  name               = "my-elb"
  load_balancer_type = "application"
  access_logs {
    bucket = aws_s3_bucket.lblogs.id
    prefix = "elb-logs/"
  }
  subnets            = [
     aws_subnet.EKS_1thprivate.id,
     aws_subnet.EKS_2thpub.id
   ]
  security_groups    = [aws_security_group.elb_sg.id]

  tags = {
    Name = "elb"
  }
}