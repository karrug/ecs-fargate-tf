module "security_groups" {
  source         = "./security-groups"
  name           = var.name
  vpc_id         = var.vpc_id
  environment    = var.environment
  container_port = var.container_port
}

module "alb" {
  source              = "./alb"
  name                = var.name
  vpc_id              = var.vpc_id
  # public subnets
  subnet_ids          = ["subnet-029b96c5108e1879d", "subnet-0a5f6bf244d906180"]
  environment         = var.environment
  alb_security_groups = [module.security_groups.alb]
  health_check_path   = "/"
}

module "ecs" {
  source                      = "./ecs"
  name                        = var.name
  environment                 = var.environment
  region                      = var.aws_region
  # private subnets
  subnet_ids                  = ["subnet-0682626adf6479507", "subnet-0e46f350619a9bf54"]
  aws_alb_target_group_arn    = module.alb.aws_alb_target_group_arn
  ecs_service_security_groups = [module.security_groups.ecs_tasks]
  container_port              = var.container_port
  container_cpu               = 512
  container_memory            = 1024
  service_desired_count       = 2
  container_environment = [
    { name = "LOG_LEVEL",
    value = "DEBUG" },
    { name = "PORT",
    value = var.container_port }
  ]
  container_image = "hehe.dkr.ecr.us-east-1.amazonaws.com/demo-crimson:latest"
}
