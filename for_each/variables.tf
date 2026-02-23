variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "This is the ami id"
}

# variable "instance_type" {
#   type    = string
#   default = "t3.micro"
# }

# variable "instances" {
#   type = map(any)
#   default = {
#     mongodb   = "t3.small"
#     user      = "t3.micro"
#     cart      = "t3.small"
#     catalogue = "t3.micro"
#   }
# }

variable "instances" {
  type = list 
  default = ["catalogue","user"]
}

variable "domain_name" {
  type    = string
  default = "daws88s.shop"
}

variable "zone_id" {
  type    = string
  default = "Z01154241BNSMMPVQO32W"
}