resource "aws_instance" "demo" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name    = "MongoDB"
    Project = "Roboshops"
  }

  provisioner "local-exec" {
     interpreter = ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-Command"]
     command = "echo '${self.private_ip}' > inventory.ini"
}
    
    provisioner "local-exec" {
     interpreter = ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-Command"]
     command = "exit 1"
     on_failure = continue
}

  provisioner "local-exec" {
     interpreter = ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-Command"]
     command = "echo script-2"    
  }
  
  provisioner "local-exec" {
    when = destroy
    interpreter = ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-Command"]
    command = "echo 'destroy ec2 instance'"
  }

#   provisioner "local-exec" {
#     when = destroy
#      interpreter = ["C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe", "-Command"]
#      command = "echo > inventory.ini"
#     #  on_failure = continue
# }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

 provisioner "remote-exec" {
    inline = [ 
          "sudo dnf install nginx -y",
          "sudo systemctl start nginx"
     ]
 }

 provisioner "remote-exec" {
   when = destroy
   inline = [ "sudo systemctl stop nginx" ]
 }

}

resource "aws_security_group" "allow_all" {
  name        = "allow_sg"
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
    Name = "allow_all"
  }
}