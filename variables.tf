variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
  default     = "ami-023508951a94f0c71" # Substitua pelo ID da AMI apropriada (ARM)
}

variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t4g.medium"
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "clinica-pes-saude"
}

variable "iam_instance_profile" {
  description = "Nome do Instance Profile associado à IAM Role"
  type        = string
  default     = "role-acesso-ssm"
}

variable "user_data" {
  description = "Script de User Data para inicialização"
  type        = string
  default     = file("/mnt/d/AWS-CURSOS/aws/projetos/botclinica/user_data.sh") # Substitua pelo caminho real do arquivo user_data.sh
}

resource "aws_instance" "clinica-pes-saude" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = data.aws_subnet.selected.id
  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  iam_instance_profile  = var.iam_instance_profile
  user_data             = var.user_data

  tags = {
    Name     = var.instance_name
    ambiente = "dev"
  }

  root_block_device {
    volume_size = 12
  }
}



