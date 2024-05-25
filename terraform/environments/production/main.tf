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

module "nat-gateway-module" {
  source       = "../../modules/nat-gateway"
  region       = local.region
  project_name = local.project_name
  environment  = local.environment

  public_subnet-az1_id       = module.vpc.public_subnet_az1_id
  public_subnet-az2_id       = module.vpc.public_subnet_az2_id
  private-app-subnet-az1_id  = module.vpc.private_app_subnet_az1_id
  private-app-subnet-az2_id  = module.vpc.private_app_subnet_az2_id
  private-db-subnet-az1_id   = module.vpc.private_db_subnet_az1_id
  private-db-subnet-az2_id   = module.vpc.private_db_subnet_az2_id
  vpc_id                     = module.vpc.vpc_id
  engineers-internet-gateway = module.vpc.internet_gateway_id
}

module "security_groups" {
  source       = "../../modules/security-groups"
  project_name = local.project_name
  environment  = local.environment
  vpc_id       = module.vpc.vpc_id
}

module "acm" {
  source          = "../../modules/acm"
  project_name    = local.project_name
  environment     = local.environment
  domain_name     = var.domain_name
  route53_zone_id = var.route53_zone_id
}

module "alb" {
  source                = "../../modules/alb"
  project_name          = local.project_name
  environment           = local.environment
  vpc_id                = module.vpc.vpc_id
  alb_security_group_id = module.security_groups.alb_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  certificate_arn       = module.acm.certificate_arn
  target_type           = "instance"
}
