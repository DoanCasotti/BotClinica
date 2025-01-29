# BotClinica

Este repositório contém a configuração para provisionar infraestrutura na AWS usando Terraform e scripts de configuração de instância EC2.

## Visão Geral

O projeto configura uma instância EC2 na AWS com o Terraform. Inclui um script de User Data para instalar e configurar o ambiente necessário para rodar o TypeBot e n8n.

## Estrutura do Repositório

- `main.tf`: Configuração principal do Terraform para criar recursos na AWS.
- `variables.tf`: Definição das variáveis utilizadas na configuração do Terraform.
- `outputs.tf`: Define as saídas da configuração do Terraform, como IDs e IPs das instâncias.
- `user_data.sh`: Script de User Data para configurar a instância EC2 com Docker, Docker Compose e Node.js.

## Configuração e Execução

### Requisitos

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

### Passos para Configuração

1. **Clone o Repositório**

   ```bash
   git clone https://github.com/DoanCasotti/BotClinica.git
   cd BotClinica

2. **Comandos Terraforms**   
   ```bash
   terraform init
   terraform plan
   terraform apply
   terraform destroy