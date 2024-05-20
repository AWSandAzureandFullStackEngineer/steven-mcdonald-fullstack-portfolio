terraform {
  backend "s3" {
    bucket         = "engineers-tech-github-actions-serverless-production"
    key            = "terraform-module/engineers-hub/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }
}

