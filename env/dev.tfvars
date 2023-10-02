# Remote State
tf_state_bucket_name = "sca-s3-tf-remote-state-us-east-1-003"
# ECS ALB
alb_name_sg_name              = "sca-sg-alb-demo-us-east-1"
alb_egress_cidr_blocks        = ["10.0.3.0/24", "10.0.4.0/24"]
alb_name                      = "sca-alb-demo-us-east-1-001"
ecs_service_target_group_name = "sca-tg-alb-demo-us-east-1-001"
# ECS Service
ecs_cluster_name = "sca-ecs-cluster-demo-us-east-1"
ecs_service_name = "sca-ecs-service-demo-us-east-1"
ecs_service_port = 3000
ecs_vpcs         = ["sca-vpc-demo-network-us-east-1-001"]
ecs_pub_subnets  = ["sca-vpc-demo-network-us-east-1-001-public-us-east-1b", "sca-vpc-demo-network-us-east-1-001-public-us-east-1c"]
ecs_pri_subnets  = ["sca-vpc-demo-network-us-east-1-001-private-us-east-1b", "sca-vpc-demo-network-us-east-1-001-private-us-east-1c"]
# ECS Service Resource
ecs_service_cpu_limit    = 512
ecs_service_memory_limit = 1024
ecs_service_app_cpu      = 256
ecs_service_app_limit    = 512
# ECS Service Container Image
ecs_service_container_image = "cnservices/microservices-demo-nodejs"