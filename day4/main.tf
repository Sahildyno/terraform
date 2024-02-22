provider "aws" {
    region = "ap-south-1"
}

terraform {
    backend "s3" {
        region = "ap-south-1"
        bucket = "mobile-1"
        key = "./terraform.tfstate"
    }
}

data "aws_security_group" "existing_sg" {
    name = "default"
    vpc_id = "vpc-0303203b0297c5f02"
}

resource "aws_security_group_rule" "allow_ssh" {
    type            = "ingress"
    to_port         = 22
    protocol        = "tcp"
    from_port       = 22
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = data.aws_security_group.existing_sg.id
}

resource "aws_security_group_rule" "allow_http" {
    type            = "ingress"
    to_port         = 80
    protocol        = "tcp"
    from_port       = 80
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = data.aws_security_group.existing_sg.id
}

resource "aws_instance" "my_instance" {
    ami = "ami-03f4878755434977f"
    instance_type = "t3.micro"
    key_name = "terraform"
    vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

    connection {
        type        = "ssh"
        user        = "ec2-user"
        private_key = file("./private.pem")
        host        = self.public_ip
    }
}