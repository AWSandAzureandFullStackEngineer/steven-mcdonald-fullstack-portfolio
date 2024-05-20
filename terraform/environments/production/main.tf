locals {
  region       = var.region
  project_name = var.project_name
  environment  = var.environment
}

module "vpc" {
  source                       = "../../modules/vpc"
  region                       = local.region
  project_name                 = local.project_name
  environment                  = local.environment
  vpc_cider                    = var.vpc_cider
  public_subnet-az1-cider      = var.public_subnet-az1-cider
  public_subnet-az2-cider      = var.public_subnet-az2-cider
  private-app-subnet-az1-cider = var.private-app-subnet-az1-cider
  private-app-subnet-az2-cider = var.private-app-subnet-az2-cider
  private-db-subnet-az1-cider  = var.private-db-subnet-az1-cider
  private-db-subnet-az2-cider  = var.private-db-subnet-az2-cider
}

module "ecs_cluster" {
  source       = "../../modules/ecs-cluster"
  cluster_name = var.cluster_name
  environment  = local.environment
  project_name = local.project_name
}

module "security_groups" {
  source              = "../../modules/security-groups"
  project_name        = local.project_name
  environment         = local.environment
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = ["0.0.0.0/0"]
}

module "alb" {
  source          = "../../modules/alb"
  project_name    = local.project_name
  environment     = local.environment
  subnets         = [module.vpc.public_subnet-az1_id, module.vpc.public_subnet-az2_id]
  security_groups = [module.security_groups.ecs_security_group_id]
  vpc_id          = module.vpc.vpc_id
}

module "aws_iam_role" {
  source       = "../../modules/iam-role"
  project_name = local.project_name
  environment  = local.environment
}

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

module "ecs_service" {
  source              = "../../modules/ecs-service"
  service_name        = var.service_name
  cluster_id          = module.ecs_cluster.ecs_cluster_id
  task_definition_arn = module.ecs_task.task_definition_arn
  desired_count       = 2
  subnets             = [module.vpc.public_subnet-az1_id, module.vpc.public_subnet-az2_id]
  security_groups     = [module.security_groups.ecs_security_group_id]
  target_group_arn    = module.alb.target_group_arn
  container_name      = module.ecs_task.container_name
  container_port      = 80
}

module "rds" {
  source            = "../../modules/rds-postgresql"
  project_name      = local.project_name
  environment       = local.environment
  allocated_storage = 20
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name           = var.db_name
  username          = var.username
  password          = var.password
  security_group_id = module.security_groups.rds_security_group_id
  subnet_group_name = module.rds_subnet_group_name
  subnet_ids        = [module.vpc.private-db-subnet-az1_id, module.vpc.private-db-subnet-az2_id]
}
