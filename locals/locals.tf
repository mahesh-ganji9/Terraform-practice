locals {
  instance_name = "${var.name}-${var.env}"
  instance_type = var.instance_type
  ami_id        = data.aws_ami.ami_data.image_id
  common_tags = {
      Project = "Roboshop"
      Terraform = "true"
      Env = "sbx"

  }
  ec2_finaltags = merge(local.common_tags, var.ec2_tags)
}

