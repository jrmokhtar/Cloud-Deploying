variable "access_key" {
  description = "AWS Access Key ID"
}

variable "secret_key" {
  description = "AWS Secret Access Key"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames for the VPC"
  default     = true
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Name = "admin_vpc"
  }
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "gateway_id" {
  description = "ID of the internet gateway"
}

variable "public_subnet_ids" {
  description = "List of subnet IDs for the public route table"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of subnet IDs for the private route table"
  type        = list(string)
}

variable "route_table_id" {
  description = "ID of the route table"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.10.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-east-1a"
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch"
  default     = true
}

variable "subnet_tags" {
  description = "Tags for the subnet"
  type        = map(string)
  default     = {
    Name = "pubadmin_subnet"
  }
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instance"
}

variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the key pair for SSH access to the EC2 instance"
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group for the RDS instance"
}

variable "security_group_id" {
  description = "ID of the security group for the RDS instance"
}

variable "username" {
  description = "Username for accessing the RDS instance"
}

variable "password" {
  description = "Password for accessing the RDS instance"
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.11.0/24"
}

variable "availability_zone_index" {
  description = "Index of the availability zone for the subnet"
  default     = 0
}

variable "allocation_id" {
  description = "ID of the EIP allocation for the NAT Gateway"
}

variable "subnet_id_1" {
  description = "ID of the subnet for the first NAT Gateway"
}

variable "subnet_id_2" {
  description = "ID of the subnet for the second NAT Gateway"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "node_group_name" {
  description = "Name of the node group"
  default     = "worker-nodes"
}

variable "node_role_arn" {
  description = "ARN of the IAM role for the node group"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the node group"
  type        = list(string)
}

variable "capacity_type" {
  description = "Capacity type for the node group"
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size for each node in the node group"
  default     = "20"
}

variable "instance_types" {
  description = "List of instance types for the nodes in the node group"
  type        = list(string)
  default     = ["t2.micro"]
}

variable "scaling_config" {
  description = "Scaling configuration for the node group"
  type        = map(number)
  default     = {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }
}

variable "update_config" {
  description = "Update configuration for the node group"
  type        = map(number)
  default     = {
    max_unavailable = 1
  }
}

variable "labels" {
  description = "Labels for the node group"
  type        = map(string)
  default     = {
    role = "general"
  }
}

variable "role_name" {
  description = "Name of the IAM role"
  default     = "eks-nodes-role"
}

variable "assume_role_policy" {
  description = "Assume role policy document for the IAM role"
  type        = string
}

variable "worker_role_name" {
  description = "Name of the IAM role for EKS worker nodes"
  default     = "eks-nodes-role"
}

variable "policies" {
  description = "List of IAM policy ARNs to attach to the IAM role"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]
}

variable "cluster_version" {
  description = "Version of Kubernetes to use for the EKS cluster"
  default     = "1.29"
}

variable "role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
}

variable "repository_name" {
  description = "Name of the ECR repository"
  default     = "ecr-repo"
}

variable "image_tag_mutability" {
  description = "Image tag mutability setting for the ECR repository"
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Whether to enable image scanning on push for the ECR repository"
  type        = bool
  default     = true
}

variable "repository_tags" {
  description = "Tags for the ECR repository"
  type        = map(string)
  default     = {
    name = "Docker_repo"
  }
}

variable "security_group_name" {
  description = "Name of the security group"
  default     = "alb-security-group"
}

variable "policy_name" {
  description = "Name of the IAM policy"
  default     = "LBAccessLogsPolicy"
}

variable "policy_description" {
  description = "Description of the IAM policy"
  default     = "Policy to allow ELB to write access logs to S3"
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket where ELB access logs will be stored"
}

variable "log_bucket_id" {
  description = "ID of the S3 bucket to store ALB access logs"
}

variable "log_prefix" {
  description = "Prefix for ALB access logs in the S3 bucket"
  default     = "elb-logs/"
}

variable "alb_subnets" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "alb_security_groups" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "assume_role_policy_document" {
  description = "JSON representation of the assume role policy document"
  type        = string
}

variable "policy_document" {
  description = "JSON representation of the policy document"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "nader-logs"
}

variable "lifecycle_days" {
  description = "Number of days before objects expire in the bucket"
  default     = 30
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  default     = "my-elb"
}
