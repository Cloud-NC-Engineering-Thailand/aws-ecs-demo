# AWS ECS Service with Application Load Balancer (ALB)
This Terraform configuration sets up an AWS ECS service with an Application Load Balancer (ALB). The configuration uses well-maintained modules from the Terraform AWS modules collection.

## Prerequisites
- Terraform v1.5.7 or newer.
- AWS CLI configured with the necessary credentials.
- Appropriate IAM permissions to create and manage the specified resources.

## Modules Used
1. **ALB Security Group**: Sets up a security group for the ALB.
2. **ALB**: Configures an Application Load Balancer.
3. **ECS Cluster**: Creates an ECS cluster with capacity providers.
4. **ECS Service**: Deploys a service in the ECS cluster.

## Overview
- The ALB is configured to listen on port 80 (HTTP) and forwards traffic to a target group associated with the ECS service.
- The ECS service runs containers based on the provided container image and exposes the application on a specific port.
- The service runs within private subnets, while the ALB is placed within public subnets.

## Usage
1. **Initialization**:

    ```bash
    terraform init
    ```

2. **Plan your resources**:

    ```bash
    terraform plan -var-file=env/dev.tfvars
    ```

3. **Apply changes**:

    ```bash
    terraform apply -var-file=env/dev.tfvars
    ```

4. **Destroy resources (if needed)**:

    ```bash
    terraform destroy -var-file=env/dev.tfvars
    ```

## Variables
You will need to provide values for various variables, including:

- `alb_name_sg_name`: Name of the ALB security group.
- `alb_egress_cidr_blocks`: CIDR blocks for ALB egress traffic.
- `alb_name`: Name of the Application Load Balancer.
- `ecs_service_target_group_name`: Name of the ECS service target group.
- `ecs_service_port`: The port on which the ECS service runs.
- `ecs_cluster_name`: Name of the ECS cluster.
- `ecs_service_name`: Name of the ECS service.
- `ecs_service_cpu_limit`: CPU limit for the ECS service.
- `ecs_service_memory_limit`: Memory limit for the ECS service.
- `ecs_service_app_cpu`: CPU configuration for the ECS service application.
- `ecs_service_app_limit`: Memory configuration for the ECS service application.
- `ecs_service_container_image`: Container image for the ECS service.