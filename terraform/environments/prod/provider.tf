terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }
}

provider "helm" {
  # Configuration options
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "ci-playground"
      ManagedBy   = "terraform"
      Environment = "prod"
    }
  }
}
