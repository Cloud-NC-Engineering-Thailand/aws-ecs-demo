# Remote State
tf_state_bucket_name = "ecs-oam-s3-tf-remote-state-ap-southeast-1-003"
# ECS ALB
alb_name_sg_name              = "ecs-oam-sg-alb-demo-ap-southeast-1"
alb_egress_cidr_blocks        = ["0.0.0.0/0"]
alb_name                      = "oam-alb-demo-ap-southeast-1-001"
ecs_service_target_group_name = "tg-alb-demo-ap-southeast-1-001"
# ECS Service
ecs_cluster_name = "oam-ecs-cluster-demo-ap-southeast-1"
ecs_service_name = "oam-ecs-service-demo-ap-southeast-1"
ecs_service_port = 3000
ecs_vpcs         = ["oam-vpc-landing-zone-ap-southeast-1-001"]
ecs_pub_subnets  = ["oam-vpc-landing-zone-ap-southeast-1-001-public-ap-southeast-1a", "oam-vpc-landing-zone-ap-southeast-1-001-public-ap-southeast-1b"]
ecs_pri_subnets  = ["oam-vpc-landing-zone-ap-southeast-1-001-private-ap-southeast-1a", "oam-vpc-landing-zone-ap-southeast-1-001-private-ap-southeast-1b"]
# ECS Service Resource
ecs_service_cpu_limit    = 512
ecs_service_memory_limit = 1024
ecs_service_app_cpu      = 256
ecs_service_app_memory    = 512
# ECS Service Container Image
ecs_service_container_image = "cnservices/microservices-demo-nodejs"