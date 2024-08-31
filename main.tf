provider "aws" {
  region  = "us-east-1"
  profile = "clinica"
}

resource "aws_instance" "typebot_n8n" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name       = var.key_name

  user_data = file("user_data.sh")

  tags = {
    Name = "TypeBot-n8n"
  }
}
# Alteração
