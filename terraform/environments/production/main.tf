# Define local variables
locals {
  region       = var.region
  project_name = var.project_name
  environment  = var.environment
}

# VPC module
module "vpc" {
  source = "../../modules/vpc"

  region                      = local.region
  project_name                = local.project_name
  environment                 = local.environment
  vpc_cidr                    = var.vpc_cider
  public_subnet_az1_cidr      = var.public_subnet-az1-cider
  public_subnet_az2_cidr      = var.public_subnet-az2-cider
  private_app_subnet_az1_cidr = var.private-app-subnet-az1-cider
  private_app_subnet_az2_cidr = var.private-app-subnet-az2-cider
  private_db_subnet_az1_cidr  = var.private-db-subnet-az1-cider
  private_db_subnet_az2_cidr  = var.private-db-subnet-az2-cider
}

# ACM module
module "ssl-certificate" {
  source            = "../../modules/acm"
  alternative_names = var.alternative_names
  domain_name       = var.domain_name
}

# CloudFront module
module "cloudfront" {
  source              = "../../modules/cloudfront"
  project_name        = local.project_name
  environment         = local.environment
  acm_certificate_arn = module.acm.acm_certificate_arn
}

# S3 module
module "s3" {
  source       = "../../modules/s3"
  project_name = local.project_name
  environment  = local.environment
}

# ECS Cluster module
module "ecs_cluster" {
  source       = "../../modules/ecs-cluster"
  cluster_name = var.cluster_name
}

# Security Groups module
module "security_groups" {
  source         = "../../modules/security-groups"
  project_name   = local.project_name
  environment    = local.environment
  container_port = var.container_port
  vpc_id         = module.vpc.vpc_id
}

# Application Load Balancer (ALB) module
module "alb" {
  source                = "../../modules/alb"
  project_name          = local.project_name
  environment           = local.environment
  vpc_id                = module.vpc.vpc_id
  target_type           = var.target_type
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  alb_security_group_id = module.security_groups.alb_security_group_id
  certificate_arn       = module.ssl-certificate.certificate_arn

}


# IAM Role module
module "aws_iam_role" {
  source       = "../../modules/iam-role"
  project_name = local.project_name
  environment  = local.environment
}

# ECS Task module
module "ecs_task" {
  source             = "../../modules/ecs-task"
  family             = var.family
  cpu                = var.cpu_size
  memory             = var.memory_size
  container_name     = var.container_name
  image              = var.image
  container_port     = var.container_port
  environment        = local.environment
  execution_role_arn = module.aws_iam_role.ecs_task_execution_role_arn
  task_role_arn      = module.aws_iam_role.task_role_arn
}

# ECS Service module
module "ecs_service" {
  source              = "../../modules/ecs-service"
  service_name        = var.service_name
  cluster_id          = module.ecs_cluster.ecs_cluster_id
  task_definition_arn = module.ecs_task.task_definition_arn
  desired_count       = 2
  assign_public_ip    = true
  subnets             = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  security_groups     = [module.security_groups.ecs_security_group_id]
  target_group_arn    = module.alb.target_group_arn
  container_name      = module.ecs_task.container_name
  container_port      = 8080
}

# RDS module
module "rds" {
  source                 = "../../modules/rds-postgresql"
  project_name           = local.project_name
  environment            = local.environment
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  vpc_security_group_ids = module.security_groups.rds_security_group_id
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  subnet_ids             = [module.vpc.private_db_subnet_az1_id, module.vpc.private_db_subnet_az2_id]
}
