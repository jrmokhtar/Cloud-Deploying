resource "aws_iam_role" "worker" {
  name = "eks-nodes-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}


############################################################

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.worker.name
}



resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.worker.name
}


resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.worker.name
}

resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.worker.name
}

resource "aws_iam_role_policy_attachment" "x-ray" {
  policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  role       = aws_iam_role.worker.name
}
resource "aws_iam_role_policy_attachment" "s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role       = aws_iam_role.worker.name
}

############################################################

resource "aws_iam_instance_profile" "worker" {
  depends_on = [aws_iam_role.worker]
  name       = "ed-eks-worker-new-profile"
  role       = aws_iam_role.worker.name
}

############################################################

resource "aws_eks_node_group" "worker-nodes" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = "worker-nodes"
  node_role_arn = aws_iam_role.worker.arn
  
  subnet_ids = [
    aws_subnet.EKS_1thprivate.id,
    aws_subnet.EKS_2thpub.id
  ]
  capacity_type = "ON_DEMAND"
  disk_size = "20"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    max_size = 5
    min_size = 1
  }
  update_config {
    max_unavailable = 1
  }
  labels = {
    role = "general"
  }
  depends_on= [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
]
}