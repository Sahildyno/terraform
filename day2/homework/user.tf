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
  acl = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}  


resource "aws_s3_bucket_policy" "A_policy" {
    bucket = aws_s3_bucket.A.id
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.example.arn}",
        "${aws_s3_bucket.example.arn}/*"
      ]
    }
  ]
}
EOF

}
