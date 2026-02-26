resource "aws_instance" "demo" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name    = "MongoDB-${var.env}"
    Project = "Roboshop-${var.env}"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "${var.env}-sg"
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
    Name = "${var.env}-sg"
  }
}