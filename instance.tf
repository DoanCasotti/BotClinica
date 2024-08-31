resource "aws_instance" "clinica_pes_saude" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = data.aws_subnet.selected.id
  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  iam_instance_profile  = var.iam_instance_profile
  user_data             = file("user_data.sh")

  tags = {
    Name     = var.instance_name
    ambiente = "dev"
  }

  root_block_device {
    volume_size = 12
  }
}
