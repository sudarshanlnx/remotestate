variable "sgname" {
  sensitive = true
}

variable "cidr" {}

variable "mytag" {}

variable "amiid" {}

variable "machinetype" {}

variable "keyname" {}

variable "lb_name" {}

variable "lb_internal" {
  default = false
}

variable "lb_subnets" {
  type = list(string)
}

variable "target_group_name" {}

variable "target_port" {
  default = 80
}

variable "target_protocol" {
  default = "HTTP"
}

variable "vpc_id" {}

variable "health_check_path" {
  default = "/"
}

variable "listener_port" {
  default = 80
}

variable "listener_protocol" {
  default = "HTTP"
}
