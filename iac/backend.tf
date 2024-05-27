terraform {
  backend "s3" {
    bucket         = "engineer-social-network-production-env-file-bucket"
    key            = "steven-porflio/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock"
  }
}
