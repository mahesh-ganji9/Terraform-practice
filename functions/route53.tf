resource "aws_route53_record" "www" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.demo[count.index].private_ip]
  allow_overwrite = true
}


resource "aws_route53_record" "www_publicip" {
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.demo[index(var.instances,"frontend")].public.ip]
  allow_overwrite = true
}