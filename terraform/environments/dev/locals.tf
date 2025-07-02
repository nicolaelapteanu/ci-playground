# Local values for common configuration
locals {
  environment = "dev"
  common_tags = {
    Project     = "ci-playground"
    ManagedBy   = "terraform"
    Environment = local.environment
    Owner       = "devops"
    CostCenter  = "engineering"
    RepoUrl     = "https://github.com/nicolaelapteanu/ci-playground"
  }
}
