terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "12345"

    workspaces {
      name = "CloudCrowd"
    }
  }
}
