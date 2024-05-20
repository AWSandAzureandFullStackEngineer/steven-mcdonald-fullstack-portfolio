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