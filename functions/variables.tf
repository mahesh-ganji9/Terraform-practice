variable "common_tags" {
   default = {
      project = "roboshop"
      terraform = "true"
      env = "dev"
   }
}

variable "ec2_tags" {
  default = {
    Name ="functions-demo"
  }
}

variable "sg_tags" {
   default = {
     Name = "functions-demo"
   }
}

variable "instances" {
  type    = list(any)
  default = ["mongodb", "catalogue", "redis", "rabbitmq", "mysql", "user", "cart", "shipping", "payment", "frontend"]
}

variable "domain_name" {
  type    = string
  default = "daws88s.shop"
}

variable "zone_id" {
  type    = string
  default = "Z01154241BNSMMPVQO32W"
}

variable "fruits" {
   type = list  
   default = ["apple","mango","banana","orange"]
}

variable "fruits_set" {
   type = set(string)
   default = ["apple","mango","banana","orange","apple"]
}