provider "aws" {
  region = var.aws_region
}

# Create VPC
resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr_block
tag = {
  Name = "$(var.project)-vpc"
  env = var.env
  }
}

# Create Subnets
resource "aws_subnet" "eks_subnet" {
  count = length(var.subnet_cidr_blocks)

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.subnet_cidr_blocks[count.index]
  availability_zone       = "ap-south-1${element(["a", "c"], count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-subnet-${element(["a", "c"], count.index)}"
  }
}

# Create EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = aws_subnet.eks_subnet[*].id
  }
}

# Create IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach AmazonEKSClusterPolicy to the IAM Role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

