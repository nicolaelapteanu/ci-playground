variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "chart_path" {
  description = "Path to the local Helm chart"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the deployment"
  type        = string
  default     = "default"
}

variable "values_file_path" {
  description = "Path to the values YAML file"
  type        = string
}

variable "max_history" {
  description = "Maximum number of revisions to keep"
  type        = number
  default     = 10
}
