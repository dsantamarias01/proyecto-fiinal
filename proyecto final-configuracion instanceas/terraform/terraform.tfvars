# VPC
vpc_cidr_block = "10.228.0.0/16"

# Subredes
public_subnet_1_cidr  = "10.228.1.0/24"
public_subnet_2_cidr  = "10.228.2.0/24"
private_subnet_1_cidr = "10.228.3.0/24"
private_subnet_2_cidr = "10.228.4.0/24"

# Región
region = "us-east-1"

# Par de claves
key_name = "ssh-david-multimedia"

# AMI Ubuntu 22.04 para us-east-1
ami_id = "ami-0f9de6e2d2f067fca"

# Tipo de instancia
instance_type = "t2.micro"

# IPs privadas
proxy_multimedia_private_ip = "10.228.1.10"
proxy_chat_private_ip       = "10.228.2.10"
servidor_multimedia1_ip     = "10.228.3.20"
servidor_multimedia2_ip     = "10.228.3.30"
servidor_chat1_ip           = "10.228.4.10"
servidor_chat2_ip           = "10.228.4.11"
