resource "aws_instance" "proxy_multimedia" {
  ami                         = var.ami_id               # AMI de Ubuntu 22.04
  instance_type               = var.instance_type        # t2.micro
  subnet_id                   = var.public_subnet_1_id   # Subred pública 1 (10.228.1.0/24)
  private_ip                  = var.proxy_multimedia_private_ip # IP fija 10.228.1.10
  associate_public_ip_address = true                    # Asigna IP pública automáticamente
  key_name                    = var.key_name            # Clave SSH para acceso
  vpc_security_group_ids      = [var.sg_proxy_multimedia_id] # SG que permite 22,80,443

  tags = {
    Name = "proxy-multimedia"  # Nombre identificativo en AWS
  }
}
resource "aws_instance" "proxy_chat" {
  ami                         = var.ami_id              # Misma AMI
  instance_type               = var.instance_type       # t2.micro
  subnet_id                   = var.public_subnet_2_id  # Subred pública 2 (10.228.2.0/24)
  private_ip                  = var.proxy_chat_private_ip # IP fija 10.228.2.10
  associate_public_ip_address = true                   # Con IP pública
  key_name                    = var.key_name           # Misma clave SSH
  vpc_security_group_ids      = [var.sg_proxy_chat_id] # SG similar al multimedia

  tags = {
    Name = "proxy-chat"  # Nombre identificativo
  }
}

resource "aws_instance" "servidor_multimedia1" {
  ami                         = var.ami_id              # Misma AMI
  instance_type               = var.instance_type       # t2.micro
  subnet_id                   = var.private_subnet_1_id # Subred privada 1 (10.228.3.0/24)
  private_ip                  = var.servidor_multimedia1_ip # IP fija 10.228.3.20
  associate_public_ip_address = false                  # Sin IP pública
  key_name                    = var.key_name           # Clave SSH
  vpc_security_group_ids      = [var.sg_jellyfin_id]   # SG que permite 8096 desde el proxy

  tags = {
    Name = "servidor-multimedia-1"  # Nombre identificativo
  }
}

resource "aws_instance" "servidor_multimedia2" {
  ami                         = var.ami_id              # Misma AMI
  instance_type               = var.instance_type       # t2.micro
  subnet_id                   = var.private_subnet_1_id # Misma subred privada 1
  private_ip                  = var.servidor_multimedia2_ip # IP fija 10.228.3.30
  associate_public_ip_address = false                  # Sin IP pública
  key_name                    = var.key_name           # Misma clave SSH
  vpc_security_group_ids      = [var.sg_jellyfin_id]  # Mismo SG

  tags = {
    Name = "servidor-multimedia-2"  # Nombre identificativo
  }
}

resource "aws_instance" "servidor_chat1" {
  ami                         = var.ami_id              # Misma AMI
  instance_type               = var.instance_type       # t2.micro
  subnet_id                   = var.private_subnet_2_id # Subred privada 2 (10.228.4.0/24)
  private_ip                  = var.servidor_chat1_ip   # IP fija 10.228.4.10
  associate_public_ip_address = false                  # Sin IP pública
  key_name                    = var.key_name           # Misma clave SSH
  vpc_security_group_ids      = [var.sg_chat_id]      # SG que permite 3000 desde proxy chat

  tags = {
    Name = "servidor-chat-1"  # Nombre identificativo
  }
}
resource "aws_instance" "servidor_chat2" {
  ami                         = var.ami_id              # Misma AMI
  instance_type               = var.instance_type       # t2.micro
  subnet_id                   = var.private_subnet_2_id # Misma subred privada 2
  private_ip                  = var.servidor_chat2_ip   # IP fija 10.228.4.11
  associate_public_ip_address = false                  # Sin IP pública
  key_name                    = var.key_name           # Misma clave SSH
  vpc_security_group_ids      = [var.sg_chat_id]       # Mismo SG

  tags = {
    Name = "servidor-chat-2"  # Nombre identificativo
  }
}
