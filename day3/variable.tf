variable "ami" {
    default = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ssh_key" {
    default = "terraform"
}

variable "project" {
    default = "cloudblitz"
}

variable "sg_id" {
    default = "sg-02b005667583d4fde"
}

variable "min_size" {
    default = 2
}

variable "max_size" {
    default = 4
}

variable "desired_capacity" {
    default = 2
}

variable "subnets" {
    default = ["subnet-0ca47169f26baa191", "subnet-0ff405b6edb107c11"]
}

variable "env" {
    default = "dev"
}

variable "vpc_id" {
    default = "vpc-0303203b0297c5f02"
}
variable "azs" {
    default = ["ap-south-1c", "ap-south-1a"]
}
