variable "ami_id" {
  description = "AMI a usar"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

# Subnets
variable "public_subnet_1_id" {
  description = "ID de la primera subred pública"
  type        = string
}

variable "public_subnet_2_id" {
  description = "ID de la segunda subred pública"
  type        = string
}

variable "private_subnet_1_id" {
  description = "ID de la primera subred privada"
  type        = string
}

variable "private_subnet_2_id" {
  description = "ID de la segunda subred privada"
  type        = string
}

# Security Groups
variable "sg_proxy_multimedia_id" {
  description = "ID del security group para el proxy multimedia"
  type        = string
}

variable "sg_proxy_chat_id" {
  description = "ID del security group para el proxy del chat"
  type        = string
}

variable "sg_jellyfin_id" {
  description = "ID del security group para los servidores Jellyfin"
  type        = string
}

variable "sg_chat_id" {
  description = "ID del security group para los servidores del chat"
  type        = string
}

# IPs privadas fijas
variable "proxy_multimedia_private_ip" {
  description = "IP privada para proxy multimedia"
  type        = string
}

variable "proxy_chat_private_ip" {
  description = "IP privada para proxy del chat"
  type        = string
}

variable "servidor_multimedia1_ip" {
  description = "IP privada para el primer servidor multimedia"
  type        = string
}

variable "servidor_multimedia2_ip" {
  description = "IP privada para el segundo servidor multimedia"
  type        = string
}

variable "servidor_chat1_ip" {
  description = "IP privada para el primer servidor de chat"
  type        = string
}

variable "servidor_chat2_ip" {
  description = "IP privada para el segundo servidor de chat"
  type        = string
}
