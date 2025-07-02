resource "aws_sqs_queue" "dlq" {
  # Conditional policy for production environment
  count = var.environment == "production" ? 1 : 0

  name                      = "${var.environment}-dlq"
  message_retention_seconds = var.message_retention_seconds_dlq
  tags = merge(var.common_tags, {
    Name = "${var.environment}-dlq"
  })
}

resource "aws_sqs_queue" "main" {
  name = "${var.environment}-main-queue"

  # Conditional policy for production environment
  redrive_policy = var.environment == "prod" ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  sqs_managed_sse_enabled    = true
  tags = merge(var.common_tags, {
    Name = "${var.environment}-main-queue"
  })
}
