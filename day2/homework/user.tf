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
  bucket = "var.s3_bucket_name"
  acl = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}  


resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
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
        "${aws_s3_bucket.A.arn}",
        "${aws_s3_bucket.A.arn}/*"
      ]
    }
  ]
}
EOF

}
