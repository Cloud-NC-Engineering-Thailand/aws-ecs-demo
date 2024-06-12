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

resource "aws_lb" "lb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [module.alb_sg.security_group_id]
  subnets                    = data.aws_subnets.pub_subnets.ids
  enable_deletion_protection = false
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}

resource "aws_lb_target_group" "target" {
  name        = var.ecs_service_target_group_name
  port        = var.ecs_service_port
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.vpc.id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

}

# module "alb" {
#   source = "terraform-aws-modules/alb/aws"
#   name   = var.alb_name

#   load_balancer_type = "application"

#   vpc_id          = data.aws_vpc.vpc.id
#   subnets         = data.aws_subnets.pub_subnets.ids
#   security_groups = [module.alb_sg.security_group_id]

#   listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     },
#   ]

#   target_groups = [
#     {
#       name             = var.ecs_service_target_group_name
#       backend_protocol = "HTTP"
#       backend_port     = var.ecs_service_port
#       target_type      = "ip"
#     },
#   ]
# }