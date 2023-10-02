variable "tf_state_bucket_name" {
  description = "The name of the tf remote state bucket"
  type        = string
}

variable "alb_name" {
  description = "Name for the Application Load Balancer."
  type        = string
}

variable "alb_name_sg_name" {
  description = "Name for the ALB security group."
  type        = string
}

variable "alb_egress_cidr_blocks" {
  description = "CIDR blocks for ALB egress rules."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ecs_service_target_group_name" {
  description = "Name for the ECS service target group."
  type        = string
}

variable "ecs_service_port" {
  description = "The port on which the ECS service is exposed."
  type        = number
}

variable "ecs_vpcs" {
  description = "VPC names filter for the ECS setup."
  type        = list(string)
}

variable "ecs_pri_subnets" {
  description = "Private subnet names filter for the ECS setup."
  type        = list(string)
}

variable "ecs_pub_subnets" {
  description = "Public subnet names filter for the ECS setup."
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster."
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service."
  type        = string
}

variable "ecs_service_cpu_limit" {
  description = "CPU limit for the ECS service."
  type        = number
}

variable "ecs_service_memory_limit" {
  description = "Memory limit for the ECS service."
  type        = number
}

variable "ecs_service_app_cpu" {
  description = "CPU allocation for the application in the ECS service."
  type        = number
}

variable "ecs_service_app_limit" {
  description = "Memory allocation for the application in the ECS service."
  type        = number
}

variable "ecs_service_container_image" {
  description = "Docker image for the ECS service container."
  type        = string
}