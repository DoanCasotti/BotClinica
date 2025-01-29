output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.typebot_n8n.id
}

output "public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.typebot_n8n.public_ip
}
