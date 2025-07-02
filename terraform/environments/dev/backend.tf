terraform {
  backend "s3" {
    bucket       = "ci-playground-terraform-state"
    key          = "environments/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
    kms_key_id   = "arn:aws:kms:us-east-1:accountid:key/key"
  }
}
