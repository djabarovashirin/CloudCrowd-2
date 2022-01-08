resource "aws_s3_bucket" "gogreens3" {
  bucket = "gogreens3-cloudcrowd"
  acl    = "private"

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 1825
    }
  }


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}