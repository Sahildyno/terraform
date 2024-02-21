variable "eks_cluster_name" {
  default     = "new-eks"
}

variable "project" {
    default = "cloudblitz"
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

