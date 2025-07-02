# DynamoDB Module
module "dynamodb" {
  source = "../../modules/dynamodb"

  environment = local.environment
  common_tags = local.common_tags
}

# SQS Module
module "sqs" {
  source = "../../modules/sqs"

  environment                = local.environment
  common_tags                = local.common_tags
  max_receive_count          = var.sqs_max_receive_count
  visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
  message_retention_seconds  = var.sqs_message_retention_seconds
  receive_wait_time_seconds  = var.sqs_receive_wait_time_seconds
  queue_depth_threshold      = var.sqs_queue_depth_threshold
}

# IAM Module
module "iam" {
  source = "../../modules/iam"

  environment        = local.environment
  common_tags        = local.common_tags
  sqs_queue_arn      = module.sqs.queue_arn
  dynamodb_table_arn = module.dynamodb.table_arn
}

# Lambda Module
module "lambda" {
  source = "../../modules/lambda"

  environment                        = local.environment
  common_tags                        = local.common_tags
  lambda_role_arn                    = module.iam.lambda_role_arn
  lambda_timeout                     = var.lambda_timeout
  lambda_memory_size                 = var.lambda_memory_size
  dynamodb_table_name                = module.dynamodb.table_name
  sqs_queue_arn                      = module.sqs.queue_arn
  sqs_batch_size                     = var.lambda_sqs_batch_size
  maximum_batching_window_in_seconds = var.lambda_maximum_batching_window_in_seconds
}

# Helm Module
module "helm" {
  source = "../../modules/helm"

  environment      = local.environment
  chart_path       = "../../../helm/nodejs-app"
  namespace        = "nodejs-app"
  values_file_path = "helm-values/nodejs-app.yaml"
}
