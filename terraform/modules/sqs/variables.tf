variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "max_receive_count" {
  description = "Maximum number of times a message can be received before being sent to the DLQ"
  type        = number
  default     = 3
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for messages in seconds"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Message retention period in seconds"
  type        = number
  default     = 345600 # 4 days
}

variable "message_retention_seconds_dlq" {
  description = "Message retention period in seconds"
  type        = number
  default     = 1209600 # 14 days
}

variable "receive_wait_time_seconds" {
  description = "Receive message wait time for long polling"
  type        = number
  default     = 20
}

variable "queue_depth_threshold" {
  description = "Threshold for queue depth alarm"
  type        = number
  default     = 100
}
