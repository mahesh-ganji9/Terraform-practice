variable "name" {
  type    = string
  default = "locals"
}

variable "env" {
  type    = string
  default = "sbx"
}

# variable "instnace_name" {
#   type = string
#   default = "${var.name}-${var.env}"
# }

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  default = {
    name = "locals"
    env  = "sbx"
  }
}

variable "sg_tags" {
  default = {
    name = "locals-sg"
    env  = "sbx"
  }
}
