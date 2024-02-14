variable "vpc_cidr" {
    default = "172.31.0.0/16"
}

variable "private_subnet_cidr" {
    default = "172.31.32.0/20"
}

variable "public_subnet_cidr" {
    default = "172.31.32.0/20"
}

variable "project" {
    default = "cloudblitz"
}

variable "env" {
    default = "dev"
}

variable "image_id" {
    default = "ami-03f4878755434977f"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "key_pair" {
    default = "new-universal-key"
}
