resource "aws_instance" "demo" {
  ami                    = local.ami_id
  instance_type          = lookup(var.ins_type, local.env)
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name    = "MongoDB-${local.env}"
    Project = "${var.project}-${local.env}"
    env     = local.env
  }
}

resource "aws_security_group" "allow_all" {
  name        = "${local.env}-sg"
  description = "Allow all inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.env}-sg"
  }
}