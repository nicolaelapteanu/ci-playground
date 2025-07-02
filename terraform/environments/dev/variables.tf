variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# SQS Variables
variable "sqs_max_receive_count" {
  description = "Maximum number of times a message can be received before being sent to the DLQ"
  type        = number
  default     = 3
}

variable "sqs_visibility_timeout_seconds" {
  description = "Visibility timeout for messages in seconds"
  type        = number
  default     = 30
}

variable "sqs_message_retention_seconds" {
  description = "Message retention period in seconds"
  type        = number
  default     = 1209600 # 14 days
}

variable "sqs_receive_wait_time_seconds" {
  description = "Receive message wait time for long polling"
  type        = number
  default     = 20
}

variable "sqs_queue_depth_threshold" {
  description = "Threshold for queue depth alarm"
  type        = number
  default     = 50 # Lower threshold for dev
}

# Lambda Variables
variable "lambda_sqs_batch_size" {
  description = "Batch size for SQS event source mapping"
  type        = number
  default     = 5 # Smaller batch size for dev
}

variable "lambda_maximum_batching_window_in_seconds" {
  description = "Maximum batching window for SQS event source mapping"
  type        = number
  default     = 5
}
