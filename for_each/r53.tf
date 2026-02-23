resource "aws_route53_record" "www" {
  for_each = aws_instance.demo
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain_name}"
  type     = "A"
  ttl      = 1
  # records  = [each.value.private_ip]
  records = [lookup(aws_instance.demo,"frontend").public_ip]
}