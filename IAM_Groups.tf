resource "aws_iam_group" "SysAdmin" {
  name = "sysadmin"
}

resource "aws_iam_group" "DBAdmin" {
  name = "dbadmin"
}

resource "aws_iam_group" "Monitor" {
  name = "monitor"
}

resource "aws_iam_group_membership" "syssadminmem" {
  name = "sys-admin-group-membership"

  users = [
    aws_iam_user.sysadmin1.name,
    aws_iam_user.sysadmin2.name,
  ]

  group = aws_iam_group.SysAdmin.name
}

resource "aws_iam_group_membership" "monmem" {
  name = "mon-mem-group-membership"

  users = [
    aws_iam_user.monitoruser1.name,
    aws_iam_user.monitoruser2.name,
    aws_iam_user.monitoruser3.name,
    aws_iam_user.monitoruser4.name,
  ]

  group = aws_iam_group.Monitor.name
}

resource "aws_iam_group_membership" "dbmem" {
  name = "mon-mem-group-membership"

  users = [
    aws_iam_user.dbadmin1.name,
    aws_iam_user.dbadmin2.name,
   
  ]

  group = aws_iam_group.Monitor.name
}