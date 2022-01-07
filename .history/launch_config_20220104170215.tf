data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  user_data     = "userdata.txt"
  security_groups = ["${aws_security_group.web-sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
}
