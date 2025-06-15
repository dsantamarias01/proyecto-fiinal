resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block  # "10.228.0.0/16"
  enable_dns_support   = true               # Habilita resolución DNS interna
  enable_dns_hostnames = true               # Asigna nombres de host DNS a instancias
  tags = { Name = "vpc-multimedia" }       # Identificación clara
}
# Subredes públicas
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr  # "10.228.1.0/24"
  map_public_ip_on_launch = true  # Asigna IP pública automáticamente
  availability_zone       = "us-east-1a"  # Zona de disponibilidad A
  tags = { Name = "public-subnet-1" }
}


resource "aws_subnet" "public_2" { 
  # Configuración similar pero en us-east-1b y CIDR 10.228.2.0/24
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public-subnet-2"
  }
}

# Subredes privadas
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr  # "10.228.3.0/24"
  availability_zone = "us-east-1a"  # Misma AZ que public_1
  tags = { Name = "private-subnet-1" }
}

resource "aws_subnet" "private_2" {   
  # Configuración similar pero en us-east-1b y CIDR 10.228.4.0/24
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "igw-multimedia" }
}

# NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"  # IP elástica para el NAT
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1.id  # Ubicado en subred pública
  tags = { Name = "nat-gateway" }
  depends_on = [aws_internet_gateway.igw]  # Requiere IGW primero
}

# Tabla de rutas públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"  # Todo el tráfico
    gateway_id = aws_internet_gateway.igw.id  # Va al IGW
  }
  tags = { Name = "public-route-table" }
}

# Asociaciones de subred pública
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

# Tabla de rutas privadas
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

# Asociaciones de subred privada
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

# Security Groups (según tus IDs usados en el módulo instances)
resource "aws_security_group" "proxy_multimedia_sg" {
  name        = "proxy-multimedia-sg"
  description = "SG para proxy multimedia"
  vpc_id      = aws_vpc.main.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "proxy-multimedia"
  }
}

resource "aws_security_group" "proxy_chat_sg" {
  name        = "proxy-chat-sg"
  description = "SG para proxy chat"
  vpc_id      = aws_vpc.main.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
   

 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "proxy-chat"
  }
}

resource "aws_security_group" "jellyfin_sg" {
  name        = "jellyfin-sg"
  description = "SG para servidor Jellyfin"
  vpc_id      = aws_vpc.main.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  

  ingress {
    from_port       = 8096
    to_port         = 8096
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_multimedia_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jellyfin"
  }
}

resource "aws_security_group" "chat_sg" {
  name        = "chat-sg"
  description = "SG para servidor de chat"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
  
  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_chat_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chat"
  }
}
