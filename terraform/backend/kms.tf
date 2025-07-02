module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 3.0"

  description             = "KMS key for ci-playground-terraform-state Terraform state encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  key_administrators = [data.aws_iam_role.admin.arn]
  key_users          = [data.aws_iam_role.user.arn]
  aliases            = ["ci-playground-terraform-state"]

  tags = {
    Name        = "Terraform State"
    Environment = "playground"
  }
}
