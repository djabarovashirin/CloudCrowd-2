resource "aws_iam_group" "SysAdmin" {
  name = "sysadmin"
}

resource "aws_iam_group" "DBAdmin" {
  name = "dbadmin"
}

resource "aws_iam_group" "Monitor" {
  name = "monitor"
}