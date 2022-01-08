# terraform {
#   backend "s3" {
#     bucket = "cloudcrowd-remote-backend"
#     key    = "remotedemo.tfstate"
#     region = "us-west-1"
#     dynamodb_table = "s3-state-lock"
#   }
# }