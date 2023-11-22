output "sg_id" {
  value = aws_security_group.web.id
}

output "sbn_id" {
  value = aws_subnet.pub_sbn_a.id
}