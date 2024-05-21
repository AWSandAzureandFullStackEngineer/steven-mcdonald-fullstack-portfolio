provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "automation"  = "terraform"
      "project"     = var.project_name
      "Environment" = var.environment
    }
  }
}