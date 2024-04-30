######################### EKS_ROLE ############################

resource "aws_iam_role" "eks_role" {
  name = "eks-role"

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  }
  POLICY
}

############################## EKS ATTACH  ################################

resource "aws_iam_role_policy_attachment" "eks_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_role.name
}


########################### EKS CLUSTER  ###################################

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  version = "1.29"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.EKS_1thprivate.id,
      aws_subnet.EKS_2thprivate.id,
      aws_subnet.EKS_1thpub.id,
      aws_subnet.EKS_2thpub.id
    ]
  }


  depends_on = [
    aws_iam_role_policy_attachment.eks_policy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}

