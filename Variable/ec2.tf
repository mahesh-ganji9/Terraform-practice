resource "aws_instance" "demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = var.ec2_tags

}

resource "aws_security_group" "allow_all" {
  name        = var.aws_sg
  description = var.aws_sg_desc

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
    ipv6_cidr_blocks = var.ipv6_cidr
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
    ipv6_cidr_blocks = var.ipv6_cidr
  }

  tags = var.sg_tags
}