variable "name" {
  type        = string
  description = "the name of your stack"
}

variable "environment" {
  type        = string
  description = "the name of your environment"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Comma separated list of subnet IDs"
}

variable "vpc_id" {
  type = string
}

variable "alb_security_groups" {
  type        = list(string)
  description = "Comma separated list of security groups"
}

variable "health_check_path" {
  type        = string
  description = "Path to check if the service is healthy"
}
