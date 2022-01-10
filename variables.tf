variable "instance_type" {

}


variable "ami" {

}

variable "vpc_cidr" {

}

variable "subnet_cidrs" {
  type = map(string)
}

variable "db_instance_class" {

}

variable "engine" {

}
variable "engine_version" {

}

variable "team-emails" {
  type = list(string)
}

variable "team-phones" {
  type = list(number)
}