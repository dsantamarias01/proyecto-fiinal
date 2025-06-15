output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "sg_proxy_multimedia_id" {
  value = aws_security_group.proxy_multimedia_sg.id
}

output "sg_proxy_chat_id" {
  value = aws_security_group.proxy_chat_sg.id
}

output "sg_jellyfin_id" {
  value = aws_security_group.jellyfin_sg.id
}

output "sg_chat_id" {
  value = aws_security_group.chat_sg.id
}
