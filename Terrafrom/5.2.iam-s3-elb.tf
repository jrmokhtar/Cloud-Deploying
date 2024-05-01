resource "aws_iam_policy" "elb_access_logs_policy" {
  name        = var.policy_name
  description = var.policy_description
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = "${var.s3_bucket_arn}/*",
      },
    ],
  })
}
############################################################################
resource "aws_iam_role" "elb_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

############################################################################
resource "aws_iam_role_policy_attachment" "attach_elb_policy" {
  policy_arn = var.policy_arn
  role       = var.role_name
}
