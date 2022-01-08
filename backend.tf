terraform {
  backend "s3" {
    bucket = "cc-remote-backend"
    key    = "remotestate.tfstate"
    region = "us-west-1"
  }
}