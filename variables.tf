variable "vpc_id" {
  description = "ID da VPC onde a instância será lançada"
  type        = string
  default     = "vpc-0caffaa239ad17a16"
}

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
  default     = "role-clinica"  # Nome da IAM role associada ao instance profile
}

variable "user_data" {
  description = "Script de User Data para inicialização"
  type        = string
  default     = file("user_data.sh") # Certifique-se de que o caminho está correto
}
