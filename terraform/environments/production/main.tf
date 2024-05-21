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

