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