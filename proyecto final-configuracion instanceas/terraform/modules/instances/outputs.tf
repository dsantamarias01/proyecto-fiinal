output "proxy_multimedia_ip" {
  value = aws_instance.proxy_multimedia.private_ip
}

output "proxy_chat_ip" {
  value = aws_instance.proxy_chat.private_ip
}

output "servidor_multimedia1_ip" {
  value = aws_instance.servidor_multimedia1.private_ip
}

output "servidor_multimedia2_ip" {
  value = aws_instance.servidor_multimedia2.private_ip
}

output "servidor_chat1_ip" {
  value = aws_instance.servidor_chat1.private_ip
}

output "servidor_chat2_ip" {
  value = aws_instance.servidor_chat2.private_ip
}
