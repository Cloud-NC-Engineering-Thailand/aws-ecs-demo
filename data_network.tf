data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = var.ecs_vpcs
  }
}

data "aws_subnets" "pri_subnets" {
  filter {
    name   = "tag:Name"
    values = var.ecs_pri_subnets
  }
}

data "aws_subnets" "pub_subnets" {
  filter {
    name   = "tag:Name"
    values = var.ecs_pub_subnets
  }
}