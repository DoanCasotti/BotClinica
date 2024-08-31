variable "ami_id" {
  description = "AMI ID para a instância EC2"
  type        = string
  default     = "ami-xxxxxxxx" # Substitua pelo ID da AMI apropriada
}

variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t4g.medium"
}

variable "key_name" {
  description = "Nome da chave SSH para acesso à instância"
  type        = string
  default     = "your-key-pair" # Substitua pelo nome da sua chave SSH
}
