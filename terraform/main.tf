provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-david-multimedia"
  public_key = file("C:/Users/Deivis/.ssh/ssh-david-multimedia.pem.pub")
}

module "network" {
  source = "./modules/network"

  vpc_cidr_block         = var.vpc_cidr_block
  public_subnet_1_cidr   = var.public_subnet_1_cidr
  public_subnet_2_cidr   = var.public_subnet_2_cidr
  private_subnet_1_cidr  = var.private_subnet_1_cidr
  private_subnet_2_cidr  = var.private_subnet_2_cidr
}

module "instances" {
  source = "./modules/instances"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name

  vpc_id              = module.network.vpc_id
  public_subnet_1_id  = module.network.public_subnet_1_id
  public_subnet_2_id  = module.network.public_subnet_2_id
  private_subnet_1_id = module.network.private_subnet_1_id
  private_subnet_2_id = module.network.private_subnet_2_id

  sg_proxy_multimedia_id = module.network.sg_proxy_multimedia_id
  sg_proxy_chat_id       = module.network.sg_proxy_chat_id
  sg_jellyfin_id         = module.network.sg_jellyfin_id
  sg_chat_id             = module.network.sg_chat_id

  proxy_multimedia_private_ip = var.proxy_multimedia_private_ip
  proxy_chat_private_ip       = var.proxy_chat_private_ip
  servidor_multimedia1_ip     = var.servidor_multimedia1_ip
  servidor_multimedia2_ip     = var.servidor_multimedia2_ip
  servidor_chat1_ip           = var.servidor_chat1_ip
  servidor_chat2_ip           = var.servidor_chat2_ip
}
