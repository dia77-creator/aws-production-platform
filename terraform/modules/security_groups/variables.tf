variable "name" {
    description = "Name prefix for security groups."
    type = string
}

variable "environment" {
    description = "Deployment environment."
    type = string
}

variable "vpc_id" {
    description = "ID of the VPC where security groups will be created."
    type        = string
}