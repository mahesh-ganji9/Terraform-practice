variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "This is the ami id"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    "Name"       = "mongodb"
    "project"    = "Roboshop"
    "automation" = "terraform"
    "env"        = "dev"
  }
}

variable "aws_sg" {
  type    = string
  default = "allow_all"
}

variable "aws_sg_desc" {
  type    = string
  default = "Allow all inbound traffic and all outbound traffic"

}

variable "from_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr" {
  type    = list(any)
  default = ["::/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    "Name"       = "allow_all"
    "project"    = "Roboshop"
    "automation" = "terraform"
    "env"        = "dev"
  }
}