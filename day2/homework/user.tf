/*provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}*/

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name = "My_s3bucket"
    env = "dev"
  }
}