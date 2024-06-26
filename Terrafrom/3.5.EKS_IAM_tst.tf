data "aws_iam_policy_document" "test_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:default:aws-test"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}
###############################################################################################
resource "aws_iam_role" "test_oidc" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy_document
}
###############################################################################################

resource "aws_iam_policy" "test_policy" {
  name   = var.policy_name
  policy = var.policy_document
}

###############################################################################################

resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.test_oidc.name
  policy_arn = aws_iam_policy.test-policy.arn
}
###############################################################################################

output "test_policy_arn" {
  value = aws_iam_role.test_oidc.arn
}
