################################################################################
# Cluster
################################################################################
module "ecs_cluster" {
  source       = "terraform-aws-modules/ecs/aws//modules/cluster"
  cluster_name = var.ecs_cluster_name
  # Capacity provider
  fargate_capacity_providers = {
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }
}

################################################################################
# Service
################################################################################
module "ecs_service" {
  source = "terraform-aws-modules/ecs/aws//modules/service"
  name   = var.ecs_service_name
  security_group_rules = {
    alb_ingress = {
      type                     = "ingress"
      from_port                = var.ecs_service_port
      to_port                  = var.ecs_service_port
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = module.alb_sg.security_group_id
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  subnet_ids  = data.aws_subnets.pri_subnets.ids
  cluster_arn = module.ecs_cluster.arn
  cpu         = var.ecs_service_cpu_limit
  memory      = var.ecs_service_memory_limit
  container_definitions = {
    (var.ecs_service_name) = {
      cpu       = var.ecs_service_app_cpu
      memory    = var.ecs_service_app_limit
      essential = true
      image     = var.ecs_service_container_image
      port_mappings = [
        {
          name          = var.ecs_service_name
          containerPort = var.ecs_service_port
          hostPort      = var.ecs_service_port
          protocol      = "tcp"
        }
      ]
      memory_reservation = 100
    }
  }
  load_balancer = {
    service = {
      target_group_arn = element(module.alb.target_group_arns, 0)
      container_name   = var.ecs_service_name
      container_port   = var.ecs_service_port
    }
  }
}