variable "name" {
  type        = string
  description = "the name of your stack"
}

variable "environment" {
  type        = string
  description = "the name of your environment, eg: stage, dev, prod"
}

variable "region" {
  type        = string
  description = "the AWS region in which resources are created"
}

variable "subnet_ids" {
  type        = list(any)
  description = "List of subnet IDs"
}

variable "ecs_service_security_groups" {
  type        = list(any)
  description = "Comma separated list of security groups"
}

variable "container_port" {
  type        = number
  description = "Port of container"
}

variable "container_cpu" {
  type        = number
  description = "The number of cpu units used by the task"
}

variable "container_memory" {
  type        = number
  description = "The amount (in MiB) of memory used by the task"
}

variable "container_image" {
  type        = string
  description = "Docker image to be launched"
}

variable "aws_alb_target_group_arn" {
  type        = string
  description = "ARN of the alb target group"
}

variable "service_desired_count" {
  type        = number
  description = "Number of services running in parallel"
}

variable "container_environment" {
  type        = list(any)
  description = "The container environmnent variables"
}
