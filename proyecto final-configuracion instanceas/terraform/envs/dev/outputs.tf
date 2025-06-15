output "proxy_multimedia_ip" {
  value = module.instances.proxy_multimedia_public_ip
}

output "proxy_chat_ip" {
  value = module.instances.proxy_chat_public_ip
}

output "servidor_multimedia1_ip" {
  value = module.instances.servidor_multimedia1_private_ip
}

output "servidor_multimedia2_ip" {
  value = module.instances.servidor_multimedia2_private_ip
}

output "servidor_chat1_ip" {
  value = module.instances.servidor_chat1_private_ip
}

output "servidor_chat2_ip" {
  value = module.instances.servidor_chat2_private_ip
}
