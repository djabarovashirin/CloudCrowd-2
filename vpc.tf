resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
tags     = {
  Name   = "Test VPC"
}
}
