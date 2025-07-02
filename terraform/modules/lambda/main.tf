# Lambda function
resource "aws_lambda_function" "main" {
  filename      = var.lambda_zip_path
  function_name = "${var.environment}-sqs-worker"
  role          = var.lambda_role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_size

  environment {
    variables = merge(var.environment_variables, {
      DYNAMODB_TABLE_NAME = var.dynamodb_table_name
      ENVIRONMENT         = var.environment
    })
  }

  #X-Ray tracing
  tracing_config {
    mode = "Active"
  }

  tags = merge(var.common_tags, {
    Name = "${var.environment}-sqs-processor"
  })
}

# SQS Event Source Mapping
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.main.function_name
  enabled          = true

  batch_size                         = var.sqs_batch_size
  maximum_batching_window_in_seconds = var.maximum_batching_window_in_seconds
  function_response_types            = ["ReportBatchItemFailures"]
}
