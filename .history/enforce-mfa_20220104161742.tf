module enforce_mfa1 {
  source  = "terraform-module/enforce-mfa/aws"
  version = "0.12.0"

  policy_name                     = "managed-mfa-enforce"
  #account_id                      = data.aws_caller_identity.current.id
  groups                          = [aws_iam_group.SysAdmin.name]
}

module enforce_mfa2 {
  source  = "terraform-module/enforce-mfa/aws"
  #version = "0.12.0"

  policy_name                     = "managed-mfa-enforce"
  #account_id                      = data.aws_caller_identity.current.id
  groups                          = [aws_iam_group.DBAdmin.name]
}

module enforce_mfa3 {
  source  = "terraform-module/enforce-mfa/aws"
  #version = "0.12.0"

  policy_name                     = "managed-mfa-enforce"
  #account_id                      = data.aws_caller_identity.current.id
  groups                          = [aws_iam_group.Monitor.name]
}