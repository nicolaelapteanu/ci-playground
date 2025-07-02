terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "ci-playground-terraform-state"
    key            = "environments/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}