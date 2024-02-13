provider "aws" {
    region = "ap-south-1"
}



# Launch AWS Instance
resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.machine_type
    key_name = "new-universal-key"
    vpc_security_group_ids = [ "sg-0ca2ae9bf1a0f4713"]
    tags = {
        Name = "my-instance"
        env = "dev"
    }
}


resource "aws_instance" "another_instance" {
    ami = var.image_id
    instance_type = var.machine_type
    key_name = "new-universal-key"
    vpc_security_group_ids = ["sg-0ca2ae9bf1a0f4713"]
    tags = {
        Name = "another-instance"
        env = "dev"
    }
}

# Variables

variable "image_id" {
    default = "ami-03f4878755434977f"
}

variable "machine_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-0970d6c61a6c23524"
}