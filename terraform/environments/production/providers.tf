provider "aws" {
 region = var.region
 profile = "devtechadmin"

 default_tags {
   tags = {
    "automation" = "terraform"
    "project" = var.project_name
    "Environment" = var.environment
   }
 }
}
