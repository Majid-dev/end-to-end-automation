output "alb-security-group_id" {
  value = aws_security_group.alb-security-group.id
}

output "webserver-security-group_id" {
  value = aws_security_group.webserver-security-group.id
}