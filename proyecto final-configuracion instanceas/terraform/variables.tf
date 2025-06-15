variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "proxy_multimedia_private_ip" {
  description = "Private IP for proxy-multimedia"
  type        = string
}

variable "proxy_chat_private_ip" {
  description = "Private IP for proxy-chat"
  type        = string
}

variable "servidor_multimedia1_ip" {
  description = "Private IP for servidor-multimedia1"
  type        = string
}

variable "servidor_multimedia2_ip" {
  description = "Private IP for servidor-multimedia2"
  type        = string
}

variable "servidor_chat1_ip" {
  description = "Private IP for servidor-chat1"
  type        = string
}

variable "servidor_chat2_ip" {
  description = "Private IP for servidor-chat2"
  type        = string
}
