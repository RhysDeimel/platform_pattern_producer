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


variable "instance_type" {
  type        = string
  description = <<EOT
  The type and size of EC2 instance you wish to use. One of:
  - t3.small
  - t3.medium
  - t3.large
  EOT

  validation {
    condition     = can(regex("t3\\.(small|medium|large)", var.instance_type))
    error_message = <<EOT
    Invalid instance type. Must be one of:
    - t3.small
    - t3.medium
    - t3.large
    EOT
  }
}


variable "name" {
  type        = string
  description = "Name of your EC2 instance"
}


variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs used to attach security groups to the instance"

  validation {
    condition = alltrue([
      for item in var.security_group_ids : can(regex("sg-[a-f0-9]{8}(?:[a-f0-9]{9})?$", item))
    ])
    error_message = "Not all security group IDs are valid"
  }
}


variable "subnet_id" {
  type        = string
  description = "ID of the subnet in which to launch the EC2 instance"

  validation {
    condition     = can(regex("subnet-[a-f0-9]{8}(?:[a-f0-9]{9})?$", var.subnet_id))
    error_message = "Not a valid subnet ID"
  }
}
