module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = var.alb_name_sg_name
  description = "Service security group"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = var.alb_egress_cidr_blocks
}

module "alb" {
  source = "terraform-aws-modules/alb/aws"
  name   = var.alb_name

  load_balancer_type = "application"

  vpc_id          = data.aws_vpc.vpc.id
  subnets         = data.aws_subnets.pub_subnets.ids
  security_groups = [module.alb_sg.security_group_id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name             = var.ecs_service_target_group_name
      backend_protocol = "HTTP"
      backend_port     = var.ecs_service_port
      target_type      = "ip"
    },
  ]
}