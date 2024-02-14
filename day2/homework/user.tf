provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_s3_bucket" "A" {
  bucket = "my-tf-test-bucket0707"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}