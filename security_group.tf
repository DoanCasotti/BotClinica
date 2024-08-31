resource "aws_security_group" "bia_dev" {
  name        = "bia-dev"
  description = "acesso da bia dev"
  vpc_id      = var.vpc_id

  ingress {
    description = "acesso geral"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
