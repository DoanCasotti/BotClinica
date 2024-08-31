#!/bin/bash

# Atualizar pacotes e instalar dependências
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl gnupg

# Instalar Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# Instalar Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "tag_name" | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Instalar Node.js e npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Criar diretório para o n8n e TypeBot
mkdir -p /home/ubuntu/n8n
cd /home/ubuntu/n8n

# Criar um arquivo docker-compose.yml para n8n e TypeBot
cat <<EOF > docker-compose.yml
version: '3'
services:
  n8n:
    image: n8n/n8n
    container_name: n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_HOST=0.0.0.0
      - N8N_PORT=5678
    volumes:
      - n8n_data:/root/.n8n
    restart: always

  typebot:
    image: typebot/typebot
    container_name: typebot
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    restart: always

volumes:
  n8n_data:
EOF

# Iniciar Docker Compose
sudo docker-compose up -d

# Adicionar swap
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab

# Reboot opcional para garantir que todas as configurações sejam aplicadas
# sudo reboot
