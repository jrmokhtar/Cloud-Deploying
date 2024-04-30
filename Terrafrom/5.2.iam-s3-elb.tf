
resource "aws_iam_policy" "elb_access_logs_policy" {
  name        = "LBAccessLogsPolicy"
  description = "Policy to allow ELB to write access logs to S3"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = "${aws_s3_bucket.lblogs.arn}/*",
      },
    ],
  })
}
############################################################################
resource "aws_iam_role" "elb_role" {
  name = "LBRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "elasticloadbalancing.amazonaws.com"
        },
        Action = "sts:AssumeRole",
      },
    ],
  })
}
############################################################################
resource "aws_iam_role_policy_attachment" "attach_elb_policy" {
  policy_arn = aws_iam_policy.elb_access_logs_policy.arn
  role       = aws_iam_role.elb_role.name
}
