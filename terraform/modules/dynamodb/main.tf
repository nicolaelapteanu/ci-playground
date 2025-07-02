resource "aws_dynamodb_table" "main" {
  name         = "${var.environment}-data-table"
  billing_mode = "PAY_PER_REQUEST" # Unpredictable workloads
  hash_key     = "ID"
  range_key    = "userId"

  attribute {
    name = "ID"
    type = "S"
  }

  attribute {
    name = "userId"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  # Enable point-in-time recovery for data recovery
  point_in_time_recovery {
    enabled = true
  }

  # Enable TTL
  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = merge(var.common_tags, {
    Name = "${var.environment}-data-table"
  })
}
