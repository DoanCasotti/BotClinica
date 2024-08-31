data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "selected" {
  id = tolist(data.aws_subnets.selected.ids)[0]
}
