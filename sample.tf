provider "aws" {
    region = "ap-south-1"
}



# Launch AWS Instance
resource "aws_instance" "my_instance" {
    ami = var.image_id
    instance_type = var.machine_type
    key_name = "shubham-nv"
    vpc_security_group_ids = [ "sg-0f0e3d11e9f465ba4", aws_security_group.my_sg.id ]
    tags = {
        Name = "my-instance"
        env = "dev"
    }
}


resource "aws_instance" "another_instance" {
    ami = var.image_id
    instance_type = var.machine_type
    key_name = "shubham-nv"
    vpc_security_group_ids = ["sg-0f0e3d11e9f465ba4"]
    tags = {
        Name = "another-instance"
        env = "dev"
    }
}

# Variables

variable "image_id" {
    default = "ami-0c7217cdde317cfec"
}

variable "machine_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-06cf206737ed67da7"
}