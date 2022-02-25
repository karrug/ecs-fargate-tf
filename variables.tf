variable "name" {
  type        = string
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  type        = string
  description = "the name of your environment"
}

variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
}

variable "service_desired_count" {
  type        = number
  description = "Number of tasks running in parallel"
}

variable "container_port" {
  type        = number
  description = "The port where the Docker is exposed"
}

variable "container_cpu" {
  type        = number
  description = "The number of cpu units used by the task"
}

variable "container_memory" {
  type        = number
  description = "The amount (in MiB) of memory used by the task"
}

variable "health_check_path" {
  type        = string
  description = "Http path for task health check"
}
