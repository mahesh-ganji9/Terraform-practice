locals {
  ami_id = data.aws_ami.ami_data.id
  env    = terraform.workspace
}