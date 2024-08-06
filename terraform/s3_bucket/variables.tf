variable "environment" {
  type        = string
  description = <<EOT
  Name of the environment. One of:
    - dev
    - test
    - prod
  EOT

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = <<EOT
    Invalid environment. Must be one of:
    - dev
    - test
    - prod
    EOT
  }
}


variable "name" {
  type        = string
  description = "Name of your S3 bucket"
}
