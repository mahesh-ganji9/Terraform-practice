variable "project" {
   default = "Roboshop"
}

variable "ins_type" {
  default = {
    dev = "t3.micro"
    sbx = "t3.small"
    prod = "t3.medium"
  }
}

